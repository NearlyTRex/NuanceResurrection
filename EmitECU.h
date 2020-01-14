#ifndef EMIT_ECU_H
#define EMIT_ECU_H

#include "mpe.h"

NativeEmitHandlerProto Emit_BRAAlways;
NativeEmitHandlerProto Emit_BRAAlways_NOP;
NativeEmitHandlerProto Emit_BRAConditional;
NativeEmitHandlerProto Emit_BRAConditional_NOP;
NativeEmitHandlerProto Emit_JMPAlwaysIndirect;
NativeEmitHandlerProto Emit_JMPAlwaysIndirect_NOP;
NativeEmitHandlerProto Emit_JMPConditionalIndirect;
NativeEmitHandlerProto Emit_JMPConditionalIndirect_NOP;
NativeEmitHandlerProto Emit_JSRAlways;
NativeEmitHandlerProto Emit_JSRAlways_NOP;
NativeEmitHandlerProto Emit_JSRAlwaysIndirect;
NativeEmitHandlerProto Emit_JSRAlwaysIndirect_NOP;
NativeEmitHandlerProto Emit_JSRConditional;
NativeEmitHandlerProto Emit_JSRConditional_NOP;
NativeEmitHandlerProto Emit_JSRConditionalIndirect;
NativeEmitHandlerProto Emit_JSRConditionalIndirect_NOP;
NativeEmitHandlerProto Emit_RTSAlways;
NativeEmitHandlerProto Emit_RTSAlways_NOP;
NativeEmitHandlerProto Emit_RTSConditional;
NativeEmitHandlerProto Emit_RTSConditional_NOP;
NativeEmitHandlerProto Emit_RTI1Conditional;
NativeEmitHandlerProto Emit_RTI1Conditional_NOP;
NativeEmitHandlerProto Emit_RTI2Conditional;
NativeEmitHandlerProto Emit_RTI2Conditional_NOP;
#endif