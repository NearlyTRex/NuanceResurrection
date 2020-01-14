; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.762 

	TITLE	c:\NuanceExperimental\FlashEEPROM.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMTD
INCLUDELIB OLDNAMES

CONST	SEGMENT
$SG3872	DB	'rb', 00H
	ORG $+1
$SG3885	DB	'wb', 00H
CONST	ENDS
PUBLIC	?LockSector@FlashEEPROM@@QAEXI@Z		; FlashEEPROM::LockSector
PUBLIC	?EraseSector@FlashEEPROM@@QAEXI@Z		; FlashEEPROM::EraseSector
PUBLIC	?EraseChip@FlashEEPROM@@QAEXXZ			; FlashEEPROM::EraseChip
PUBLIC	?IsSectorLocked@FlashEEPROM@@QAE_NI@Z		; FlashEEPROM::IsSectorLocked
PUBLIC	?WriteData@FlashEEPROM@@QAEXII@Z		; FlashEEPROM::WriteData
EXTRN	__RTC_CheckEsp:PROC
EXTRN	__RTC_Shutdown:PROC
EXTRN	__RTC_InitBase:PROC
;	COMDAT rtc$TMZ
; File c:\nuanceexperimental\flasheeprom.cpp
rtc$TMZ	SEGMENT
__RTC_Shutdown.rtc$TMZ DD FLAT:__RTC_Shutdown
rtc$TMZ	ENDS
;	COMDAT rtc$IMZ
rtc$IMZ	SEGMENT
__RTC_InitBase.rtc$IMZ DD FLAT:__RTC_InitBase
; Function compile flags: /Odtp /RTCsu
rtc$IMZ	ENDS
_TEXT	SEGMENT
tv190 = -28						; size = 4
tv175 = -24						; size = 4
tv93 = -20						; size = 4
tv70 = -16						; size = 4
tv68 = -12						; size = 4
_commandAddress$ = -8					; size = 4
_this$ = -4						; size = 4
_address$ = 8						; size = 4
_data1$ = 12						; size = 4
?WriteData@FlashEEPROM@@QAEXII@Z PROC			; FlashEEPROM::WriteData
; _this$ = ecx

; 6    : {

	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	eax, -858993460				; ccccccccH
	mov	DWORD PTR [ebp-28], eax
	mov	DWORD PTR [ebp-24], eax
	mov	DWORD PTR [ebp-20], eax
	mov	DWORD PTR [ebp-16], eax
	mov	DWORD PTR [ebp-12], eax
	mov	DWORD PTR [ebp-8], eax
	mov	DWORD PTR [ebp-4], eax
	mov	DWORD PTR _this$[ebp], ecx

; 7    :   uint32 commandAddress = (address >> 1) & 0x7FF;

	mov	eax, DWORD PTR _address$[ebp]
	shr	eax, 1
	and	eax, 2047				; 000007ffH
	mov	DWORD PTR _commandAddress$[ebp], eax

; 8    :   data1 >>= 24;

	mov	ecx, DWORD PTR _data1$[ebp]
	shr	ecx, 24					; 00000018H
	mov	DWORD PTR _data1$[ebp], ecx

; 9    : 
; 10   :   switch(mode)

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+28]
	mov	DWORD PTR tv68[ebp], eax
	cmp	DWORD PTR tv68[ebp], 5
	ja	$LN46@WriteData
	mov	ecx, DWORD PTR tv68[ebp]
	jmp	DWORD PTR $LN48@WriteData[ecx*4]
$LN43@WriteData:

; 11   :   {
; 12   :     case FlashMode_Read:
; 13   :       switch(state)

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR tv70[ebp], eax
	cmp	DWORD PTR tv70[ebp], 1
	je	SHORT $LN40@WriteData
	cmp	DWORD PTR tv70[ebp], 2
	je	$LN35@WriteData
	cmp	DWORD PTR tv70[ebp], 3
	je	$LN32@WriteData
	jmp	$LN41@WriteData
$LN40@WriteData:

; 14   :       {
; 15   :         case EEPROM_STATE_READ:
; 16   :           if(((commandAddress & 0xFF) == 0x55) && (data1 == 0x98))

	mov	ecx, DWORD PTR _commandAddress$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 85					; 00000055H
	jne	SHORT $LN39@WriteData
	cmp	DWORD PTR _data1$[ebp], 152		; 00000098H
	jne	SHORT $LN39@WriteData

; 17   :           {
; 18   :             mode = FlashMode_CFI;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+28], 1

; 19   :             errorMode = FlashMode_CFI;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], 1

; 20   :             state = EEPROM_STATE_READ;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 21   :             errorState = EEPROM_STATE_READ;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 1

; 22   :           }
; 23   :           else

	jmp	SHORT $LN38@WriteData
$LN39@WriteData:

; 24   :           {
; 25   :             if((commandAddress == 0x555) && (data1 == 0xAA))

	cmp	DWORD PTR _commandAddress$[ebp], 1365	; 00000555H
	jne	SHORT $LN37@WriteData
	cmp	DWORD PTR _data1$[ebp], 170		; 000000aaH
	jne	SHORT $LN37@WriteData

; 26   :             {
; 27   :               state = EEPROM_STATE_BUS_CYCLE_2;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 2

; 28   :             }
; 29   :             else

	jmp	SHORT $LN38@WriteData
$LN37@WriteData:

; 30   :             {
; 31   :               mode = errorMode;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+32]
	mov	DWORD PTR [ecx+28], eax

; 32   :               state = errorState;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [ecx+12], eax
$LN38@WriteData:

; 33   :             }
; 34   :           }
; 35   :           break;

	jmp	$LN41@WriteData
$LN35@WriteData:

; 36   :         case EEPROM_STATE_BUS_CYCLE_2:
; 37   :           if((commandAddress == 0x2AA) && (data1 == 0x55))

	cmp	DWORD PTR _commandAddress$[ebp], 682	; 000002aaH
	jne	SHORT $LN34@WriteData
	cmp	DWORD PTR _data1$[ebp], 85		; 00000055H
	jne	SHORT $LN34@WriteData

; 38   :           {
; 39   :             state = EEPROM_STATE_BUS_CYCLE_3;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 3

; 40   :           }
; 41   :           else

	jmp	SHORT $LN33@WriteData
$LN34@WriteData:

; 42   :           {
; 43   :             mode = errorMode;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+28], ecx

; 44   :             state = errorState;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	DWORD PTR [edx+12], ecx
$LN33@WriteData:

; 45   :           }
; 46   :           break;

	jmp	$LN41@WriteData
$LN32@WriteData:

; 47   :         case EEPROM_STATE_BUS_CYCLE_3:
; 48   :           if(commandAddress == 0x555)

	cmp	DWORD PTR _commandAddress$[ebp], 1365	; 00000555H
	jne	$LN31@WriteData

; 49   :           {
; 50   :             switch(data1)

	mov	edx, DWORD PTR _data1$[ebp]
	mov	DWORD PTR tv93[ebp], edx
	cmp	DWORD PTR tv93[ebp], 128		; 00000080H
	je	SHORT $LN28@WriteData
	cmp	DWORD PTR tv93[ebp], 144		; 00000090H
	je	SHORT $LN27@WriteData
	cmp	DWORD PTR tv93[ebp], 160		; 000000a0H
	je	SHORT $LN26@WriteData
	jmp	SHORT $LN25@WriteData
$LN28@WriteData:

; 51   :             {
; 52   :               case 0x80:
; 53   :                 //Next three bus cycles needed to trigger sector erase, chip erase or sector lockdown
; 54   :                 mode = FlashMode_Erase;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+28], 5

; 55   :                 state = EEPROM_STATE_BUS_CYCLE_4;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 4

; 56   :                 break;

	jmp	SHORT $LN29@WriteData
$LN27@WriteData:

; 57   :               case 0x90:
; 58   :                 //Enter ProductID mode
; 59   :                 mode = FlashMode_ProductID;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+28], 4

; 60   :                 errorMode = FlashMode_ProductID;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], 4

; 61   :                 state = EEPROM_STATE_READ;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 62   :                 errorState = EEPROM_STATE_READ;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 1

; 63   :                 break;

	jmp	SHORT $LN29@WriteData
$LN26@WriteData:

; 64   :               case 0xA0:
; 65   :                 //Next bus cycle expected to be write address and data
; 66   :                 mode = FlashMode_Program;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+28], 3

; 67   :                 state = EEPROM_STATE_BUS_CYCLE_4;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 4

; 68   :                 break;

	jmp	SHORT $LN29@WriteData
$LN25@WriteData:

; 69   :               default:
; 70   :                 mode = errorMode;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+28], ecx

; 71   :                 state = errorState;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	DWORD PTR [edx+12], ecx
$LN29@WriteData:

; 72   :             }
; 73   :           }
; 74   :           else

	jmp	SHORT $LN41@WriteData
$LN31@WriteData:

; 75   :           {
; 76   :             mode = errorMode;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+28], ecx

; 77   :             state = errorState;

	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	DWORD PTR [edx+12], ecx
$LN41@WriteData:

; 78   :           }
; 79   :           break;
; 80   :       }
; 81   :       break;

	jmp	$LN46@WriteData
$LN23@WriteData:

; 82   :     case FlashMode_CFI:
; 83   :       if(data1 == 0xF0)

	cmp	DWORD PTR _data1$[ebp], 240		; 000000f0H
	jne	SHORT $LN22@WriteData

; 84   :       {
; 85   :         mode = FlashMode_Read;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+28], 0

; 86   :         errorMode = FlashMode_Read;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], 0

; 87   :         state = EEPROM_STATE_READ;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 88   :         errorState = EEPROM_STATE_READ;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 1
$LN22@WriteData:

; 89   :       }     
; 90   :       break;

	jmp	$LN46@WriteData
$LN21@WriteData:

; 91   :     case FlashMode_ProductID:
; 92   :       if(data1 == 0xF0)

	cmp	DWORD PTR _data1$[ebp], 240		; 000000f0H
	jne	SHORT $LN20@WriteData

; 93   :       {
; 94   :         mode = FlashMode_Read;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+28], 0

; 95   :         errorMode = FlashMode_Read;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+32], 0

; 96   :         state = EEPROM_STATE_READ;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], 1

; 97   :         errorState = EEPROM_STATE_READ;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+16], 1
$LN20@WriteData:

; 98   :       }
; 99   :       break;

	jmp	$LN46@WriteData
$LN19@WriteData:

; 100  :     case FlashMode_Program:
; 101  :       if(!IsSectorLocked(address))

	mov	ecx, DWORD PTR _address$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IsSectorLocked@FlashEEPROM@@QAE_NI@Z	; FlashEEPROM::IsSectorLocked
	movzx	edx, al
	test	edx, edx
	jne	SHORT $LN18@WriteData

; 102  :       {
; 103  :         //Cannot turn 0's to 1's, only 1's to 0's (0e op 0w: 0e, 0e op 1w: 0e, 1e op 0w: 0e, 1e op 1w: 1e)
; 104  :         eeprom[address] &= data1;

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _address$[ebp]
	movzx	eax, BYTE PTR [ecx+edx]
	and	eax, DWORD PTR _data1$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _address$[ebp]
	mov	BYTE PTR [edx+ecx], al
$LN18@WriteData:

; 105  :       }
; 106  :       mode = FlashMode_Read;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+28], 0

; 107  :       errorMode = FlashMode_Read;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], 0

; 108  :       state = EEPROM_STATE_READ;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 109  :       errorState = EEPROM_STATE_READ;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 1

; 110  :       break;

	jmp	$LN46@WriteData
$LN17@WriteData:

; 111  :     case FlashMode_Erase:
; 112  :     {
; 113  :       switch(state)

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	DWORD PTR tv175[ebp], ecx
	cmp	DWORD PTR tv175[ebp], 4
	je	SHORT $LN14@WriteData
	cmp	DWORD PTR tv175[ebp], 5
	je	SHORT $LN11@WriteData
	cmp	DWORD PTR tv175[ebp], 6
	je	SHORT $LN8@WriteData
	jmp	$LN46@WriteData
$LN14@WriteData:

; 114  :       {
; 115  :         case EEPROM_STATE_BUS_CYCLE_4:
; 116  :           if((commandAddress == 0x555) && (data1 == 0xAA))

	cmp	DWORD PTR _commandAddress$[ebp], 1365	; 00000555H
	jne	SHORT $LN13@WriteData
	cmp	DWORD PTR _data1$[ebp], 170		; 000000aaH
	jne	SHORT $LN13@WriteData

; 117  :           {
; 118  :             state = EEPROM_STATE_BUS_CYCLE_5;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], 5

; 119  :           }
; 120  :           else

	jmp	SHORT $LN12@WriteData
$LN13@WriteData:

; 121  :           {
; 122  :             mode = errorMode;

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	mov	DWORD PTR [eax+28], edx

; 123  :             state = errorState;

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax+12], edx
$LN12@WriteData:

; 124  :           }
; 125  :           break;

	jmp	$LN46@WriteData
$LN11@WriteData:

; 126  :         case EEPROM_STATE_BUS_CYCLE_5:
; 127  :           if((commandAddress == 0x2AA) && (data1 == 0x55))

	cmp	DWORD PTR _commandAddress$[ebp], 682	; 000002aaH
	jne	SHORT $LN10@WriteData
	cmp	DWORD PTR _data1$[ebp], 85		; 00000055H
	jne	SHORT $LN10@WriteData

; 128  :           {
; 129  :             state = EEPROM_STATE_BUS_CYCLE_6;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 6

; 130  :           }
; 131  :           else

	jmp	SHORT $LN8@WriteData
$LN10@WriteData:

; 132  :           {
; 133  :             mode = errorMode;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+32]
	mov	DWORD PTR [ecx+28], eax

; 134  :             state = errorState;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [ecx+12], eax
$LN8@WriteData:

; 135  :           }
; 136  :         case EEPROM_STATE_BUS_CYCLE_6:
; 137  :         {
; 138  :           switch(data1)

	mov	ecx, DWORD PTR _data1$[ebp]
	mov	DWORD PTR tv190[ebp], ecx
	cmp	DWORD PTR tv190[ebp], 16		; 00000010H
	je	SHORT $LN5@WriteData
	cmp	DWORD PTR tv190[ebp], 48		; 00000030H
	je	SHORT $LN3@WriteData
	cmp	DWORD PTR tv190[ebp], 96		; 00000060H
	je	SHORT $LN2@WriteData
	jmp	$LN46@WriteData
$LN5@WriteData:

; 139  :           {
; 140  :             case 0x10:
; 141  :               //Erase Chip
; 142  :               if(commandAddress == 0x555)

	cmp	DWORD PTR _commandAddress$[ebp], 1365	; 00000555H
	jne	SHORT $LN4@WriteData

; 143  :               {
; 144  :                 EraseChip();

	mov	ecx, DWORD PTR _this$[ebp]
	call	?EraseChip@FlashEEPROM@@QAEXXZ		; FlashEEPROM::EraseChip
$LN4@WriteData:

; 145  :               }
; 146  :               mode = FlashMode_Read;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+28], 0

; 147  :               errorMode = FlashMode_Read;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], 0

; 148  :               state = EEPROM_STATE_READ;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 1

; 149  :               errorState = EEPROM_STATE_READ;              

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 1

; 150  :               break;

	jmp	SHORT $LN46@WriteData
$LN3@WriteData:

; 151  :             case 0x30:
; 152  :               //Erase Sector
; 153  :               EraseSector(address);

	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EraseSector@FlashEEPROM@@QAEXI@Z	; FlashEEPROM::EraseSector

; 154  :               mode = FlashMode_Read;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+28], 0

; 155  :               errorMode = FlashMode_Read;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+32], 0

; 156  :               state = EEPROM_STATE_READ;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 1

; 157  :               errorState = EEPROM_STATE_READ;              

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], 1

; 158  :               break;

	jmp	SHORT $LN46@WriteData
$LN2@WriteData:

; 159  :             case 0x60:
; 160  :               //Sector Lockdown
; 161  :               LockSector(address);

	mov	edx, DWORD PTR _address$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?LockSector@FlashEEPROM@@QAEXI@Z	; FlashEEPROM::LockSector

; 162  :               mode = FlashMode_Read;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+28], 0

; 163  :               errorMode = FlashMode_Read;

	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+32], 0

; 164  :               state = EEPROM_STATE_READ;

	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], 1

; 165  :               errorState = EEPROM_STATE_READ;

	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+16], 1
$LN46@WriteData:

; 166  :               break;
; 167  :             default:
; 168  :               break;
; 169  :           }
; 170  :           break;
; 171  :         }
; 172  :       }
; 173  :     }
; 174  :   }
; 175  : }

	add	esp, 28					; 0000001cH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	8
	npad	1
$LN48@WriteData:
	DD	$LN43@WriteData
	DD	$LN23@WriteData
	DD	$LN46@WriteData
	DD	$LN19@WriteData
	DD	$LN21@WriteData
	DD	$LN17@WriteData
?WriteData@FlashEEPROM@@QAEXII@Z ENDP			; FlashEEPROM::WriteData
_TEXT	ENDS
PUBLIC	?ReadData@FlashEEPROM@@QAEXIPAI@Z		; FlashEEPROM::ReadData
; Function compile flags: /Odtp /RTCsu
_TEXT	SEGMENT
tv65 = -8						; size = 4
_this$ = -4						; size = 4
_address$ = 8						; size = 4
_buffer$ = 12						; size = 4
?ReadData@FlashEEPROM@@QAEXIPAI@Z PROC			; FlashEEPROM::ReadData
; _this$ = ecx

; 178  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR [ebp-8], -858993460		; ccccccccH
	mov	DWORD PTR [ebp-4], -858993460		; ccccccccH
	mov	DWORD PTR _this$[ebp], ecx

; 179  :   switch(mode)

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR tv65[ebp], ecx
	cmp	DWORD PTR tv65[ebp], 0
	je	SHORT $LN6@ReadData
	cmp	DWORD PTR tv65[ebp], 4
	je	SHORT $LN5@ReadData
	jmp	$LN9@ReadData
$LN6@ReadData:

; 180  :   {
; 181  :     case FlashMode_Read:
; 182  :       buffer[0] = 
; 183  :         (((uint32)(eeprom[address & (DEFAULT_EEPROM_SIZE - 1)])) << 24) |
; 184  :         (((uint32)(eeprom[(address + 1) & (DEFAULT_EEPROM_SIZE - 1)])) << 16) |
; 185  :         (((uint32)(eeprom[(address + 2) & (DEFAULT_EEPROM_SIZE - 1)])) << 8) |
; 186  :         (((uint32)(eeprom[(address + 3) & (DEFAULT_EEPROM_SIZE - 1)])) << 0);

	mov	edx, DWORD PTR _address$[ebp]
	and	edx, 2097151				; 001fffffH
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	movzx	edx, BYTE PTR [ecx+edx]
	shl	edx, 24					; 00000018H
	mov	eax, DWORD PTR _address$[ebp]
	add	eax, 1
	and	eax, 2097151				; 001fffffH
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	movzx	eax, BYTE PTR [ecx+eax]
	shl	eax, 16					; 00000010H
	or	edx, eax
	mov	ecx, DWORD PTR _address$[ebp]
	add	ecx, 2
	and	ecx, 2097151				; 001fffffH
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+4]
	movzx	ecx, BYTE PTR [eax+ecx]
	shl	ecx, 8
	or	edx, ecx
	mov	eax, DWORD PTR _address$[ebp]
	add	eax, 3
	and	eax, 2097151				; 001fffffH
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	movzx	eax, BYTE PTR [ecx+eax]
	or	edx, eax
	mov	ecx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [ecx], edx

; 187  :       break;

	jmp	SHORT $LN9@ReadData
$LN5@ReadData:

; 188  :     case FlashMode_ProductID:
; 189  :       if(address & 0x02)

	mov	edx, DWORD PTR _address$[ebp]
	and	edx, 2
	je	SHORT $LN4@ReadData

; 190  :       {
; 191  :         buffer[0] = (eepromDeviceID << 24);

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	shl	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [edx], ecx

; 192  :       }
; 193  :       else

	jmp	SHORT $LN9@ReadData
$LN4@ReadData:

; 194  :       {
; 195  :         buffer[0] = (eepromManufacturerCode << 24);

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	shl	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [edx], ecx
$LN9@ReadData:

; 196  :       }
; 197  :       break;
; 198  :     case FlashMode_CFI:
; 199  :       break;
; 200  :     default:
; 201  :       break;
; 202  :   }
; 203  : }

	mov	esp, ebp
	pop	ebp
	ret	8
?ReadData@FlashEEPROM@@QAEXIPAI@Z ENDP			; FlashEEPROM::ReadData
_TEXT	ENDS
PUBLIC	?ReadStatus@FlashEEPROM@@QAEIXZ			; FlashEEPROM::ReadStatus
; Function compile flags: /Odtp /RTCsu
_TEXT	SEGMENT
_this$ = -4						; size = 4
?ReadStatus@FlashEEPROM@@QAEIXZ PROC			; FlashEEPROM::ReadStatus
; _this$ = ecx

; 206  : {

	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR [ebp-4], -858993460		; ccccccccH
	mov	DWORD PTR _this$[ebp], ecx

; 207  :   return 0;

	xor	eax, eax

; 208  : }

	mov	esp, ebp
	pop	ebp
	ret	0
?ReadStatus@FlashEEPROM@@QAEIXZ ENDP			; FlashEEPROM::ReadStatus
; Function compile flags: /Odtp /RTCsu
_i$ = -8						; size = 4
_this$ = -4						; size = 4
_address$ = 8						; size = 4
?IsSectorLocked@FlashEEPROM@@QAE_NI@Z PROC		; FlashEEPROM::IsSectorLocked
; _this$ = ecx

; 211  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR [ebp-8], -858993460		; ccccccccH
	mov	DWORD PTR [ebp-4], -858993460		; ccccccccH
	mov	DWORD PTR _this$[ebp], ecx

; 212  :   uint32 i;
; 213  : 
; 214  :   if(address < 0x10000)

	cmp	DWORD PTR _address$[ebp], 65536		; 00010000H
	jae	SHORT $LN2@IsSectorLo

; 215  :   {
; 216  :     //Bottom boot sector (8Kbyte)
; 217  :     i = (address >> 13);

	mov	eax, DWORD PTR _address$[ebp]
	shr	eax, 13					; 0000000dH
	mov	DWORD PTR _i$[ebp], eax

; 218  :   }
; 219  :   else

	jmp	SHORT $LN1@IsSectorLo
$LN2@IsSectorLo:

; 220  :   {
; 221  :     //normal sector (64Kbyte)
; 222  :     i = (address >> 16);

	mov	ecx, DWORD PTR _address$[ebp]
	shr	ecx, 16					; 00000010H
	mov	DWORD PTR _i$[ebp], ecx
$LN1@IsSectorLo:

; 223  :   }
; 224  :   
; 225  :   return sectorLockStatus[i];

	mov	edx, DWORD PTR _this$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx+36]

; 226  : }

	mov	esp, ebp
	pop	ebp
	ret	4
?IsSectorLocked@FlashEEPROM@@QAE_NI@Z ENDP		; FlashEEPROM::IsSectorLocked
; Function compile flags: /Odtp /RTCsu
_i$ = -8						; size = 4
_this$ = -4						; size = 4
?EraseChip@FlashEEPROM@@QAEXXZ PROC			; FlashEEPROM::EraseChip
; _this$ = ecx

; 229  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR [ebp-8], -858993460		; ccccccccH
	mov	DWORD PTR [ebp-4], -858993460		; ccccccccH
	mov	DWORD PTR _this$[ebp], ecx

; 230  :   uint32 i;
; 231  : 
; 232  :   for(i = 0; i < DEFAULT_NUM_SECTORS; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $LN5@EraseChip
$LN4@EraseChip:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$LN5@EraseChip:
	cmp	DWORD PTR _i$[ebp], 39			; 00000027H
	jae	SHORT $LN6@EraseChip

; 233  :   {
; 234  :     if(i < 8)

	cmp	DWORD PTR _i$[ebp], 8
	jae	SHORT $LN2@EraseChip

; 235  :     {
; 236  :       //Bottom boot sector (8 Kbytes)
; 237  :       EraseSector(i << 13);

	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 13					; 0000000dH
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EraseSector@FlashEEPROM@@QAEXI@Z	; FlashEEPROM::EraseSector

; 238  :     }
; 239  :     else

	jmp	SHORT $LN1@EraseChip
$LN2@EraseChip:

; 240  :     {
; 241  :       //Normal sector (64 Kbytes)
; 242  :       EraseSector(i << 16);

	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 16					; 00000010H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EraseSector@FlashEEPROM@@QAEXI@Z	; FlashEEPROM::EraseSector
$LN1@EraseChip:

; 243  :     }

	jmp	SHORT $LN4@EraseChip
$LN6@EraseChip:

; 244  :   }
; 245  : }

	add	esp, 8
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
?EraseChip@FlashEEPROM@@QAEXXZ ENDP			; FlashEEPROM::EraseChip
; Function compile flags: /Odtp /RTCsu
_i$3854 = -16						; size = 4
_pEEPROM$ = -12						; size = 4
_sectorSize$ = -8					; size = 4
_this$ = -4						; size = 4
_address$ = 8						; size = 4
?EraseSector@FlashEEPROM@@QAEXI@Z PROC			; FlashEEPROM::EraseSector
; _this$ = ecx

; 248  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	eax, -858993460				; ccccccccH
	mov	DWORD PTR [ebp-16], eax
	mov	DWORD PTR [ebp-12], eax
	mov	DWORD PTR [ebp-8], eax
	mov	DWORD PTR [ebp-4], eax
	mov	DWORD PTR _this$[ebp], ecx

; 249  :   uint32 sectorSize;
; 250  :   uint8 *pEEPROM;
; 251  : 
; 252  :   if(address < 0x10000)

	cmp	DWORD PTR _address$[ebp], 65536		; 00010000H
	jae	SHORT $LN6@EraseSecto

; 253  :   {
; 254  :     sectorSize = 8192;

	mov	DWORD PTR _sectorSize$[ebp], 8192	; 00002000H

; 255  :   }
; 256  :   else

	jmp	SHORT $LN5@EraseSecto
$LN6@EraseSecto:

; 257  :   {
; 258  :     sectorSize = 65536;

	mov	DWORD PTR _sectorSize$[ebp], 65536	; 00010000H
$LN5@EraseSecto:

; 259  :   }
; 260  :   
; 261  :   address &= ~(sectorSize - 1);

	mov	eax, DWORD PTR _sectorSize$[ebp]
	sub	eax, 1
	not	eax
	and	eax, DWORD PTR _address$[ebp]
	mov	DWORD PTR _address$[ebp], eax

; 262  : 
; 263  :   if(!IsSectorLocked(address))

	mov	ecx, DWORD PTR _address$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IsSectorLocked@FlashEEPROM@@QAE_NI@Z	; FlashEEPROM::IsSectorLocked
	movzx	edx, al
	test	edx, edx
	jne	SHORT $LN7@EraseSecto

; 264  :   {
; 265  :     pEEPROM = &eeprom[address];

	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, DWORD PTR _address$[ebp]
	mov	DWORD PTR _pEEPROM$[ebp], ecx

; 266  :     for(uint32 i = 0; i < sectorSize; i++)

	mov	DWORD PTR _i$3854[ebp], 0
	jmp	SHORT $LN3@EraseSecto
$LN2@EraseSecto:
	mov	edx, DWORD PTR _i$3854[ebp]
	add	edx, 1
	mov	DWORD PTR _i$3854[ebp], edx
$LN3@EraseSecto:
	mov	eax, DWORD PTR _i$3854[ebp]
	cmp	eax, DWORD PTR _sectorSize$[ebp]
	jae	SHORT $LN7@EraseSecto

; 267  :     {
; 268  :       //Erase turns 0's to 1's
; 269  :       *pEEPROM++ = 0xFF;

	mov	ecx, DWORD PTR _pEEPROM$[ebp]
	mov	BYTE PTR [ecx], 255			; 000000ffH
	mov	edx, DWORD PTR _pEEPROM$[ebp]
	add	edx, 1
	mov	DWORD PTR _pEEPROM$[ebp], edx

; 270  :     }

	jmp	SHORT $LN2@EraseSecto
$LN7@EraseSecto:

; 271  :   }
; 272  : }

	add	esp, 16					; 00000010H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	4
?EraseSector@FlashEEPROM@@QAEXI@Z ENDP			; FlashEEPROM::EraseSector
; Function compile flags: /Odtp /RTCsu
_i$ = -8						; size = 4
_this$ = -4						; size = 4
_address$ = 8						; size = 4
?LockSector@FlashEEPROM@@QAEXI@Z PROC			; FlashEEPROM::LockSector
; _this$ = ecx

; 275  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR [ebp-8], -858993460		; ccccccccH
	mov	DWORD PTR [ebp-4], -858993460		; ccccccccH
	mov	DWORD PTR _this$[ebp], ecx

; 276  :   uint32 i;
; 277  : 
; 278  :   if(address < 0x10000)

	cmp	DWORD PTR _address$[ebp], 65536		; 00010000H
	jae	SHORT $LN2@LockSector

; 279  :   {
; 280  :     //Bottom boot sector (8Kbyte)
; 281  :     i = (address >> 13);

	mov	eax, DWORD PTR _address$[ebp]
	shr	eax, 13					; 0000000dH
	mov	DWORD PTR _i$[ebp], eax

; 282  :   }
; 283  :   else

	jmp	SHORT $LN1@LockSector
$LN2@LockSector:

; 284  :   {
; 285  :     //normal sector (64Kbyte)
; 286  :     i = (address >> 16);

	mov	ecx, DWORD PTR _address$[ebp]
	shr	ecx, 16					; 00000010H
	mov	DWORD PTR _i$[ebp], ecx
$LN1@LockSector:

; 287  :   }
; 288  :   
; 289  :   sectorLockStatus[i] = true;

	mov	edx, DWORD PTR _this$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx+36], 1

; 290  : }

	mov	esp, ebp
	pop	ebp
	ret	4
?LockSector@FlashEEPROM@@QAEXI@Z ENDP			; FlashEEPROM::LockSector
_TEXT	ENDS
PUBLIC	?LoadFromFile@FlashEEPROM@@QAEXPAD@Z		; FlashEEPROM::LoadFromFile
EXTRN	_fclose:PROC
EXTRN	_fgetc:PROC
EXTRN	_ftell:PROC
EXTRN	_fseek:PROC
EXTRN	_fopen:PROC
; Function compile flags: /Odtp /RTCsu
_TEXT	SEGMENT
_fileLength$ = -16					; size = 4
_i$ = -12						; size = 4
_inFile$ = -8						; size = 4
_this$ = -4						; size = 4
_fileName$ = 8						; size = 4
?LoadFromFile@FlashEEPROM@@QAEXPAD@Z PROC		; FlashEEPROM::LoadFromFile
; _this$ = ecx

; 293  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	eax, -858993460				; ccccccccH
	mov	DWORD PTR [ebp-16], eax
	mov	DWORD PTR [ebp-12], eax
	mov	DWORD PTR [ebp-8], eax
	mov	DWORD PTR [ebp-4], eax
	mov	DWORD PTR _this$[ebp], ecx

; 294  :   FILE *inFile;
; 295  :   uint32 i, fileLength;
; 296  : 
; 297  :   inFile = fopen(fileName,"rb");

	push	OFFSET $SG3872
	mov	eax, DWORD PTR _fileName$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _inFile$[ebp], eax

; 298  : 
; 299  :   if(inFile)

	cmp	DWORD PTR _inFile$[ebp], 0
	je	$LN6@LoadFromFi

; 300  :   {
; 301  :     fseek(inFile,0,SEEK_END);

	push	2
	push	0
	mov	ecx, DWORD PTR _inFile$[ebp]
	push	ecx
	call	_fseek
	add	esp, 12					; 0000000cH

; 302  :     fileLength = ftell(inFile) + 1;

	mov	edx, DWORD PTR _inFile$[ebp]
	push	edx
	call	_ftell
	add	esp, 4
	add	eax, 1
	mov	DWORD PTR _fileLength$[ebp], eax

; 303  :     if(fileLength > DEFAULT_EEPROM_SIZE)

	cmp	DWORD PTR _fileLength$[ebp], 2097152	; 00200000H
	jbe	SHORT $LN4@LoadFromFi

; 304  :     {
; 305  :       fileLength = DEFAULT_EEPROM_SIZE;

	mov	DWORD PTR _fileLength$[ebp], 2097152	; 00200000H
$LN4@LoadFromFi:

; 306  :     }
; 307  : 
; 308  :     fseek(inFile,0,SEEK_SET);

	push	0
	push	0
	mov	eax, DWORD PTR _inFile$[ebp]
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH

; 309  :     for(i = 0; i < fileLength; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $LN3@LoadFromFi
$LN2@LoadFromFi:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$LN3@LoadFromFi:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _fileLength$[ebp]
	jae	SHORT $LN1@LoadFromFi

; 310  :     {
; 311  :       eeprom[i] = (uint8)(fgetc(inFile));

	mov	eax, DWORD PTR _inFile$[ebp]
	push	eax
	call	_fgetc
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx+ecx], al

; 312  :     }

	jmp	SHORT $LN2@LoadFromFi
$LN1@LoadFromFi:

; 313  :     fclose(inFile);

	mov	edx, DWORD PTR _inFile$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
$LN6@LoadFromFi:

; 314  :   }
; 315  : }

	add	esp, 16					; 00000010H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	4
?LoadFromFile@FlashEEPROM@@QAEXPAD@Z ENDP		; FlashEEPROM::LoadFromFile
_TEXT	ENDS
PUBLIC	?SaveToFile@FlashEEPROM@@QAEXPAD@Z		; FlashEEPROM::SaveToFile
EXTRN	_fputc:PROC
; Function compile flags: /Odtp /RTCsu
_TEXT	SEGMENT
_i$ = -12						; size = 4
_outFile$ = -8						; size = 4
_this$ = -4						; size = 4
_fileName$ = 8						; size = 4
?SaveToFile@FlashEEPROM@@QAEXPAD@Z PROC			; FlashEEPROM::SaveToFile
; _this$ = ecx

; 318  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR [ebp-12], -858993460		; ccccccccH
	mov	DWORD PTR [ebp-8], -858993460		; ccccccccH
	mov	DWORD PTR [ebp-4], -858993460		; ccccccccH
	mov	DWORD PTR _this$[ebp], ecx

; 319  :   FILE *outFile;
; 320  :   uint32 i;
; 321  : 
; 322  :   outFile = fopen(fileName,"wb");

	push	OFFSET $SG3885
	mov	eax, DWORD PTR _fileName$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _outFile$[ebp], eax

; 323  : 
; 324  :   if(outFile)

	cmp	DWORD PTR _outFile$[ebp], 0
	je	SHORT $LN5@SaveToFile

; 325  :   {
; 326  :     for(i = 0; i < DEFAULT_EEPROM_SIZE; i++)

	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $LN3@SaveToFile
$LN2@SaveToFile:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$LN3@SaveToFile:
	cmp	DWORD PTR _i$[ebp], 2097152		; 00200000H
	jae	SHORT $LN1@SaveToFile

; 327  :     {
; 328  :       fputc((int)(eeprom[i]),outFile);

	mov	edx, DWORD PTR _outFile$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _i$[ebp]
	movzx	eax, BYTE PTR [ecx+edx]
	push	eax
	call	_fputc
	add	esp, 8

; 329  :     }

	jmp	SHORT $LN2@SaveToFile
$LN1@SaveToFile:

; 330  :     fclose(outFile);

	mov	ecx, DWORD PTR _outFile$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
$LN5@SaveToFile:

; 331  :   }
; 332  : }

	add	esp, 12					; 0000000cH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	4
?SaveToFile@FlashEEPROM@@QAEXPAD@Z ENDP			; FlashEEPROM::SaveToFile
_TEXT	ENDS
END
