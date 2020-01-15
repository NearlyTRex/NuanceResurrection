#ifndef dmaH
#define dmaH

#include "basetypes.h"

class MPE;

#define GetPixBaseAddr(base,offset,shift) ((base) + ((offset) << (shift)))

typedef void (* BilinearDMAHandler)(MPE *the_mpe, const uint32 flags, const uint32 baseaddr, const uint32 xinfo, const uint32 yinfo, const uint32 intaddr);
typedef void BilinearDMAHandlerProto(MPE *, const uint32, const uint32, const uint32, const uint32, const uint32);

void DMALinear(MPE *mpe, const uint32 flags, const uint32 baseaddr, const uint32 intaddr);
void DMALinear(MPE *mpe);
void DMABiLinear(MPE *the_mpe, const uint32 flags, const uint32 baseaddr, const uint32 xinfo, const uint32 yinfo, const uint32 intaddr);
void DMABiLinear(MPE *mpe);
void DMAWait(MPE * const mpe);
void DMADo(MPE *mpe);

#endif
