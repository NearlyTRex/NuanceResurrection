#ifndef NUONMEMORYMAP_H
#define NUONMEMORYMAP_H

#define MPE_ADDR_SPACE_BASE (0x20000000UL)
#define MPE_DTROM_BASE (0x20000000UL)
#define MPE_DTRAM_BASE (0x20100000UL)
#define MPE_IROM_BASE (0x20200000UL)
#define MPE_IRAM_BASE (0x20300000UL)
#define MPE_DTAGS_BASE (0x20400000UL)
#define MPE_ITAGS_BASE (0x20480000UL)
#define MPE_CTRL_BASE (0x20500000UL)
#define MPE_RESV_BASE (0x20600000UL)
#define MPE1_ADDR_BASE (0x20800000UL)
#define MPE4_ADDR_BASE (0x22000000UL)
#define MAIN_BUS_BASE (0x40000000UL)
#define SYSTEM_BUS_BASE (0x80000000UL)
#define BIOS_JUMPTABLE_START (0x80000000UL) // 64K used for jump tables, BIOS internal data structures, and a few user-visible data structures (up to 0x8000FFFFUL)
#define BIOS_JUMPTABLE_END (0x800002FFUL)
#define HAL_JUMPTABLE_START (0x80006000UL)
#define HAL_JUMPTABLE_END (0x80007FFFUL)
#define DVD_JUMPTABLE_START (0x80008000UL)
#define DVD_JUMPTABLE_END (0x8000AFFFUL)
#define PE_ADDR_BASE (0x804E0000UL) // 3200K-640K for DVD Video Presentation Engine memory, WHEN activated (up to BIOS_FUNCTIONS_BASE) // Hitchhikers.pdf says 0x804A0000UL
#define BIOS_FUNCTIONS_BASE (0x80760000UL) // 640K of other ram-resident BIOS code and data, as well as a memory arena for downloaded device drivers and other required memory allocation (up to 0x807FFFFFUL)
#define SRAM_0_BASE (0x90000000UL)
#define SRAM_1_BASE (0xA0000000UL)
#define ROM_BIOS_BASE (0xF0000000UL)
#define ROM_PE_BASE (0xF0008000UL)

//Presentation Engine Jumptables
#define SVC_API_JUMPTABLE_START (0x80008000UL)
#define AUDIO_API_JUMPTABLE_START (0x80008400UL)
#define CDA_API_JUMPTABLE_START (0x80008800UL)
#define DVD_API_JUMPTABLE_START (0x80008C00UL)
#define DVDA_API_JUMPTABLE_START (0x80009000UL)
#define NTC_API_JUMPTABLE_START (0x80009200UL)
#define SVR_API_JUMPTABLE_START (0x80009400UL)
#define VCD_API_JUMPTABLE_START (0x80009800UL)
#define VIDEO_API_JUMPTABLE_START (0x80009C00UL)
#define PTR_API_JUMPTABLE_START (0x8000A000UL)

#define MPE_LOCAL_MEMORY_SIZE (8UL*1024UL*1024UL)
#define OVERLAY_SIZE (8UL * 1024UL)
#define MAIN_BUS_SIZE (8UL*1024UL*1024UL)
#define SYSTEM_BUS_SIZE (8UL*1024UL*1024UL)
#define BIOS_FUNCTIONS_SIZE (640UL*1024UL)
#define BIOS_LOWMEM_SIZE (64UL*1024UL)

#define MPE_DTROM_OFFSET (0x00000000UL)
#define MPE_DTRAM_OFFSET (0x00100000UL)
#define MPE_IROM_OFFSET (0x00200000UL)
#define MPE_IRAM_OFFSET (0x00300000UL)
#define MPE_CTRL_REG_OFFSET (0x00500000UL)
#define MPE_RESERVED_MEM_OFFSET (0x00600000UL)
#define MPE_LOCAL_MEMORY_MASK (0x207FFFFFUL)
#define MPE_VALID_MEMORY_MASK (0x007FFFFFUL) //8 MEG WRAPAROUND
#define MAIN_BUS_VALID_MEMORY_MASK (0x007FFFFFUL) //8 MEG WRAPAROUND
#define SYSTEM_BUS_VALID_MEMORY_MASK (0x007FFFFFUL) //8 MEG WRAPAROUND

#endif
