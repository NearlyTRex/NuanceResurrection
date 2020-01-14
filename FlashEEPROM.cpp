#include <assert.h>
#include "basetypes.h"
#include "FlashEEPROM.h"
#include <stdio.h>

void FlashEEPROM::WriteData(uint32 address, uint32 data1)
{
  uint32 commandAddress = (address >> 1) & 0x7FF;
  data1 >>= 24;

  switch(mode)
  {
    case FlashMode_Read:
      switch(state)
      {
        case EEPROM_STATE_READ:
          if(((commandAddress & 0xFF) == 0x55) && (data1 == 0x98))
          {
            mode = FlashMode_CFI;
            errorMode = FlashMode_CFI;
            state = EEPROM_STATE_READ;
            errorState = EEPROM_STATE_READ;
          }
          else
          {
            if((commandAddress == 0x555) && (data1 == 0xAA))
            {
              state = EEPROM_STATE_BUS_CYCLE_2;
            }
            else
            {
              mode = errorMode;
              state = errorState;
            }
          }
          break;
        case EEPROM_STATE_BUS_CYCLE_2:
          if((commandAddress == 0x2AA) && (data1 == 0x55))
          {
            state = EEPROM_STATE_BUS_CYCLE_3;
          }
          else
          {
            mode = errorMode;
            state = errorState;
          }
          break;
        case EEPROM_STATE_BUS_CYCLE_3:
          if(commandAddress == 0x555)
          {
            switch(data1)
            {
              case 0x80:
                //Next three bus cycles needed to trigger sector erase, chip erase or sector lockdown
                mode = FlashMode_Erase;
                state = EEPROM_STATE_BUS_CYCLE_4;
                break;
              case 0x90:
                //Enter ProductID mode
                mode = FlashMode_ProductID;
                errorMode = FlashMode_ProductID;
                state = EEPROM_STATE_READ;
                errorState = EEPROM_STATE_READ;
                break;
              case 0xA0:
                //Next bus cycle expected to be write address and data
                mode = FlashMode_Program;
                state = EEPROM_STATE_BUS_CYCLE_4;
                break;
              default:
                mode = errorMode;
                state = errorState;
            }
          }
          else
          {
            mode = errorMode;
            state = errorState;
          }
          break;
      }
      break;
    case FlashMode_CFI:
      if(data1 == 0xF0)
      {
        mode = FlashMode_Read;
        errorMode = FlashMode_Read;
        state = EEPROM_STATE_READ;
        errorState = EEPROM_STATE_READ;
      }     
      break;
    case FlashMode_ProductID:
      if(data1 == 0xF0)
      {
        mode = FlashMode_Read;
        errorMode = FlashMode_Read;
        state = EEPROM_STATE_READ;
        errorState = EEPROM_STATE_READ;
      }
      break;
    case FlashMode_Program:
      if(!IsSectorLocked(address))
      {
        //Cannot turn 0's to 1's, only 1's to 0's (0e op 0w: 0e, 0e op 1w: 0e, 1e op 0w: 0e, 1e op 1w: 1e)
        eeprom[address] &= data1;
      }
      mode = FlashMode_Read;
      errorMode = FlashMode_Read;
      state = EEPROM_STATE_READ;
      errorState = EEPROM_STATE_READ;
      break;
    case FlashMode_Erase:
    {
      switch(state)
      {
        case EEPROM_STATE_BUS_CYCLE_4:
          if((commandAddress == 0x555) && (data1 == 0xAA))
          {
            state = EEPROM_STATE_BUS_CYCLE_5;
          }
          else
          {
            mode = errorMode;
            state = errorState;
          }
          break;
        case EEPROM_STATE_BUS_CYCLE_5:
          if((commandAddress == 0x2AA) && (data1 == 0x55))
          {
            state = EEPROM_STATE_BUS_CYCLE_6;
          }
          else
          {
            mode = errorMode;
            state = errorState;
          }
        case EEPROM_STATE_BUS_CYCLE_6:
        {
          switch(data1)
          {
            case 0x10:
              //Erase Chip
              if(commandAddress == 0x555)
              {
                EraseChip();
              }
              mode = FlashMode_Read;
              errorMode = FlashMode_Read;
              state = EEPROM_STATE_READ;
              errorState = EEPROM_STATE_READ;              
              break;
            case 0x30:
              //Erase Sector
              EraseSector(address);
              mode = FlashMode_Read;
              errorMode = FlashMode_Read;
              state = EEPROM_STATE_READ;
              errorState = EEPROM_STATE_READ;              
              break;
            case 0x60:
              //Sector Lockdown
              LockSector(address);
              mode = FlashMode_Read;
              errorMode = FlashMode_Read;
              state = EEPROM_STATE_READ;
              errorState = EEPROM_STATE_READ;
              break;
            default:
              break;
          }
          break;
        }
      }
    }
    case FlashMode_Error:
    case FlashMode_SinglePulseProgram:
      assert(!"not implemented");
      break;
  }
}

void FlashEEPROM::ReadData(uint32 address, uint32 *buffer)
{
  switch(mode)
  {
    case FlashMode_Read:
      buffer[0] = 
        (((uint32)(eeprom[address & (DEFAULT_EEPROM_SIZE - 1)])) << 24) |
        (((uint32)(eeprom[(address + 1) & (DEFAULT_EEPROM_SIZE - 1)])) << 16) |
        (((uint32)(eeprom[(address + 2) & (DEFAULT_EEPROM_SIZE - 1)])) << 8) |
        (((uint32)(eeprom[(address + 3) & (DEFAULT_EEPROM_SIZE - 1)])) << 0);
      break;
    case FlashMode_ProductID:
      if(address & 0x02)
      {
        buffer[0] = (eepromDeviceID << 24);
      }
      else
      {
        buffer[0] = (eepromManufacturerCode << 24);
      }
      break;
    case FlashMode_CFI:
      break;
    default:
      break;
  }
}

uint32 FlashEEPROM::ReadStatus()
{
  return 0;
}

bool FlashEEPROM::IsSectorLocked(uint32 address)
{
  uint32 i;

  if(address < 0x10000)
  {
    //Bottom boot sector (8Kbyte)
    i = (address >> 13);
  }
  else
  {
    //normal sector (64Kbyte)
    i = (address >> 16);
  }
  
  return sectorLockStatus[i];
}

void FlashEEPROM::EraseChip()
{
  uint32 i;

  for(i = 0; i < DEFAULT_NUM_SECTORS; i++)
  {
    if(i < 8)
    {
      //Bottom boot sector (8 Kbytes)
      EraseSector(i << 13);
    }
    else
    {
      //Normal sector (64 Kbytes)
      EraseSector(i << 16);
    }
  }
}

void FlashEEPROM::EraseSector(uint32 address)
{
  uint32 sectorSize;
  uint8 *pEEPROM;

  if(address < 0x10000)
  {
    sectorSize = 8192;
  }
  else
  {
    sectorSize = 65536;
  }
  
  address &= ~(sectorSize - 1);

  if(!IsSectorLocked(address))
  {
    pEEPROM = &eeprom[address];
    for(uint32 i = 0; i < sectorSize; i++)
    {
      //Erase turns 0's to 1's
      *pEEPROM++ = 0xFF;
    }
  }
}

void FlashEEPROM::LockSector(uint32 address)
{
  uint32 i;

  if(address < 0x10000)
  {
    //Bottom boot sector (8Kbyte)
    i = (address >> 13);
  }
  else
  {
    //normal sector (64Kbyte)
    i = (address >> 16);
  }
  
  sectorLockStatus[i] = true;
}

void FlashEEPROM::LoadFromFile(const char * const fileName)
{
  FILE *inFile = fopen(fileName,"rb");

  if(inFile)
  {
    fseek(inFile,0,SEEK_END);
    uint32 fileLength = ftell(inFile) + 1;
    if(fileLength > DEFAULT_EEPROM_SIZE)
    {
      fileLength = DEFAULT_EEPROM_SIZE;
    }

    fseek(inFile,0,SEEK_SET);
    for(uint32 i = 0; i < fileLength; i++)
    {
      eeprom[i] = (uint8)(fgetc(inFile));
    }
    fclose(inFile);
  }
}

void FlashEEPROM::SaveToFile(const char * const fileName)
{
  FILE *outFile = fopen(fileName,"wb");

  if(outFile)
  {
    for(uint32 i = 0; i < DEFAULT_EEPROM_SIZE; i++)
    {
      fputc((int)(eeprom[i]),outFile);
    }
    fclose(outFile);
  }
}

