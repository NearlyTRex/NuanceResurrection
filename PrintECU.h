#ifndef PRINTECU_H
#define PRINTECU_H

#include "mpe.h"

NuancePrintHandlerProto Print_ECU_NOP;
NuancePrintHandlerProto Print_Halt;
NuancePrintHandlerProto Print_BRAAlways;
NuancePrintHandlerProto Print_BRAAlways_NOP;
NuancePrintHandlerProto Print_BRAConditional;
NuancePrintHandlerProto Print_BRAConditional_NOP;
NuancePrintHandlerProto Print_JMPAlwaysIndirect;
NuancePrintHandlerProto Print_JMPAlwaysIndirect_NOP;
NuancePrintHandlerProto Print_JMPConditionalIndirect;
NuancePrintHandlerProto Print_JMPConditionalIndirect_NOP;
NuancePrintHandlerProto Print_JSRAlways;
NuancePrintHandlerProto Print_JSRAlways_NOP;
NuancePrintHandlerProto Print_JSRConditional;
NuancePrintHandlerProto Print_JSRConditional_NOP;
NuancePrintHandlerProto Print_JSRAlwaysIndirect;
NuancePrintHandlerProto Print_JSRAlwaysIndirect_NOP;
NuancePrintHandlerProto Print_JSRConditionalIndirect;
NuancePrintHandlerProto Print_JSRConditionalIndirect_NOP;
NuancePrintHandlerProto Print_RTSAlways;
NuancePrintHandlerProto Print_RTSAlways_NOP;
NuancePrintHandlerProto Print_RTSConditional;
NuancePrintHandlerProto Print_RTSConditional_NOP;
NuancePrintHandlerProto Print_RTI1Conditional;
NuancePrintHandlerProto Print_RTI1Conditional_NOP;
NuancePrintHandlerProto Print_RTI2Conditional;
NuancePrintHandlerProto Print_RTI2Conditional_NOP;

#endif