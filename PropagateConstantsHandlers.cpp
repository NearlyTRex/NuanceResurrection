#include "PropagateConstants.h"
#include "PropagateConstants_ALU.h"
#include "PropagateConstants_ECU.h"
#include "PropagateConstants_RCU.h"
#include "PropagateConstants_MEM.h"
#include "PropagateConstants_MUL.h"
#include "SuperBlockConstants.h"

const PropagateConstantsHandler ConstantHandlers[] = {
  //ECU HANDLERS
  PropagateConstants_ECU_NOP,
  PropagateConstants_Halt,
  PropagateConstants_BRAAlways,
  PropagateConstants_BRAAlways_NOP,
  PropagateConstants_BRAConditional,
  PropagateConstants_BRAConditional_NOP,
  PropagateConstants_JMPAlwaysIndirect,
  PropagateConstants_JMPAlwaysIndirect_NOP,
  PropagateConstants_JMPConditionalIndirect,
  PropagateConstants_JMPConditionalIndirect_NOP,
  PropagateConstants_JSRAlways,
  PropagateConstants_JSRAlways_NOP,
  PropagateConstants_JSRConditional,
  PropagateConstants_JSRConditional_NOP,
  PropagateConstants_JSRAlwaysIndirect,
  PropagateConstants_JSRAlwaysIndirect_NOP,
  PropagateConstants_JSRConditionalIndirect,
  PropagateConstants_JSRConditionalIndirect_NOP,
  PropagateConstants_RTI1Conditional,
  PropagateConstants_RTI1Conditional_NOP,
  PropagateConstants_RTI2Conditional,
  PropagateConstants_RTI2Conditional_NOP,
  PropagateConstants_RTSAlways,
  PropagateConstants_RTSAlways_NOP,
  PropagateConstants_RTSConditional,
  PropagateConstants_RTSConditional_NOP,
  //RCU HANDLERS
  PropagateConstants_DECRc1,
  PropagateConstants_DECRc0,
  PropagateConstants_DECBoth,
  PropagateConstants_ADDRImmediateOnly,
  PropagateConstants_ADDRImmediate,
  PropagateConstants_ADDRScalarOnly,
  PropagateConstants_ADDRScalar,
  PropagateConstants_MVRImmediateOnly,
  PropagateConstants_MVRImmediate,
  PropagateConstants_MVRScalarOnly,
  PropagateConstants_MVRScalar,
  PropagateConstants_RangeOnly,
  PropagateConstants_Range,
  PropagateConstants_ModuloOnly,
  PropagateConstants_Modulo,
  //ALU HANDLERS
  PropagateConstants_ABS,
  PropagateConstants_BITSScalar,
  PropagateConstants_BITSImmediate,
  PropagateConstants_BTST,
  PropagateConstants_BUTT,
  PropagateConstants_COPY,
  PropagateConstants_MSB,
  PropagateConstants_SAT,
  PropagateConstants_AS,
  PropagateConstants_ASL,
  PropagateConstants_ASR,
  PropagateConstants_LS,
  PropagateConstants_LSR,
  PropagateConstants_ROT,
  PropagateConstants_ROL,
  PropagateConstants_ROR,
  PropagateConstants_ADD_P,
  PropagateConstants_SUB_P,
  PropagateConstants_ADD_SV,
  PropagateConstants_SUB_SV,
  PropagateConstants_ADDImmediate,
  PropagateConstants_ADDScalar,
  PropagateConstants_ADDScalarShiftRightImmediate,
  PropagateConstants_ADDScalarShiftLeftImmediate,
  PropagateConstants_SUBImmediate,
  PropagateConstants_SUBImmediateReverse,
  PropagateConstants_SUBScalar,
  PropagateConstants_SUBScalarShiftRightImmediate,
  PropagateConstants_SUBScalarShiftLeftImmediate,
  PropagateConstants_CMPImmediate,
  PropagateConstants_CMPImmediateReverse,
  PropagateConstants_CMPScalar,
  PropagateConstants_CMPScalarShiftRightImmediate,
  PropagateConstants_CMPScalarShiftLeftImmediate,
  PropagateConstants_ANDImmediate,
  PropagateConstants_ANDScalar,
  PropagateConstants_ANDImmediateShiftScalar,
  PropagateConstants_ANDScalarShiftRightImmediate,
  PropagateConstants_ANDScalarShiftLeftImmediate,
  PropagateConstants_ANDScalarShiftScalar,
  PropagateConstants_ANDScalarRotateScalar,
  PropagateConstants_FTSTImmediate,
  PropagateConstants_FTSTScalar,
  PropagateConstants_FTSTImmediateShiftScalar,
  PropagateConstants_FTSTScalarShiftRightImmediate,
  PropagateConstants_FTSTScalarShiftLeftImmediate,
  PropagateConstants_FTSTScalarShiftScalar,
  PropagateConstants_FTSTScalarRotateScalar,
  PropagateConstants_ORImmediate,
  PropagateConstants_ORScalar,
  PropagateConstants_ORImmediateShiftScalar,
  PropagateConstants_ORScalarShiftRightImmediate,
  PropagateConstants_ORScalarShiftLeftImmediate,
  PropagateConstants_ORScalarShiftScalar,
  PropagateConstants_ORScalarRotateScalar,
  PropagateConstants_EORImmediate,
  PropagateConstants_EORScalar,
  PropagateConstants_EORImmediateShiftScalar,
  PropagateConstants_EORScalarShiftRightImmediate,
  PropagateConstants_EORScalarShiftLeftImmediate,
  PropagateConstants_EORScalarShiftScalar,
  PropagateConstants_EORScalarRotateScalar,
  PropagateConstants_ADDWCScalar,
  PropagateConstants_ADDWCImmediate,
  PropagateConstants_ADDWCScalarShiftRightImmediate,
  PropagateConstants_ADDWCScalarShiftLeftImmediate,
  PropagateConstants_SUBWCScalar,
  PropagateConstants_SUBWCImmediate,
  PropagateConstants_SUBWCImmediateReverse,
  PropagateConstants_SUBWCScalarShiftRightImmediate,
  PropagateConstants_SUBWCScalarShiftLeftImmediate,
  PropagateConstants_CMPWCScalar,
  PropagateConstants_CMPWCImmediate,
  PropagateConstants_CMPWCImmediateReverse,
  PropagateConstants_CMPWCScalarShiftRightImmediate,
  PropagateConstants_CMPWCScalarShiftLeftImmediate,
  //MUL HANDLERS
  PropagateConstants_ADDM,
  PropagateConstants_ADDMImmediate,
  PropagateConstants_SUBM,
  PropagateConstants_SUBMImmediateReverse,
  PropagateConstants_MULScalarShiftAcshift,
  PropagateConstants_MULScalarShiftRightImmediate,
  PropagateConstants_MULScalarShiftLeftImmediate,
  PropagateConstants_MULImmediateShiftAcshift,
  PropagateConstants_MULScalarShiftScalar,
  PropagateConstants_MULImmediateShiftScalar,
  PropagateConstants_MULImmediateShiftRightImmediate,
  PropagateConstants_MULImmediateShiftLeftImmediate,
  PropagateConstants_MUL_SVImmediateShiftImmediate,
  PropagateConstants_MUL_SVScalarShiftImmediate,
  PropagateConstants_MUL_SVScalarShiftSvshift,
  PropagateConstants_MUL_SVRuShiftImmediate,
  PropagateConstants_MUL_SVRuShiftSvshift,
  PropagateConstants_MUL_SVRvShiftImmediate,
  PropagateConstants_MUL_SVRvShiftSvshift,
  PropagateConstants_MUL_SVVectorShiftImmediate,
  PropagateConstants_MUL_SVVectorShiftSvshift,
  PropagateConstants_MUL_PImmediateShiftImmediate,
  PropagateConstants_MUL_PScalarShiftImmediate,
  PropagateConstants_MUL_PScalarShiftSvshift,
  PropagateConstants_MUL_PRuShiftImmediate,
  PropagateConstants_MUL_PRuShiftSvshift,
  PropagateConstants_MUL_PRvShiftImmediate,
  PropagateConstants_MUL_PRvShiftSvshift,
  PropagateConstants_MUL_PVectorShiftImmediate,
  PropagateConstants_MUL_PVectorShiftSvshift,
  PropagateConstants_DOTPScalarShiftImmediate,
  PropagateConstants_DOTPScalarShiftSvshift,
  PropagateConstants_DOTPVectorShiftImmediate,
  PropagateConstants_DOTPVectorShiftSvshift,
  //MEM HABDLERS
  PropagateConstants_Mirror,
  PropagateConstants_MV_SImmediate,
  PropagateConstants_MV_SScalar,
  PropagateConstants_MV_V,
  PropagateConstants_PopVector,
  PropagateConstants_PopVectorRz,
  PropagateConstants_PopScalarRzi1,
  PropagateConstants_PopScalarRzi2,
  PropagateConstants_PushVector,
  PropagateConstants_PushVectorRz,
  PropagateConstants_PushScalarRzi1,
  PropagateConstants_PushScalarRzi2,
  PropagateConstants_LoadScalarLinear,
  PropagateConstants_LoadScalarControlRegisterAbsolute,
  PropagateConstants_LoadByteAbsolute,
  PropagateConstants_LoadWordAbsolute,
  PropagateConstants_LoadScalarAbsolute,
  PropagateConstants_LoadShortVectorAbsolute,
  PropagateConstants_LoadVectorAbsolute,
  PropagateConstants_LoadVectorControlRegisterAbsolute,
  PropagateConstants_LoadPixelAbsolute,
  PropagateConstants_LoadPixelZAbsolute,
  PropagateConstants_LoadByteLinear,
  PropagateConstants_LoadByteBilinearUV,
  PropagateConstants_LoadByteBilinearXY,
  PropagateConstants_LoadWordLinear,
  PropagateConstants_LoadWordBilinearUV,
  PropagateConstants_LoadWordBilinearXY,
  PropagateConstants_LoadScalarBilinearUV,
  PropagateConstants_LoadScalarBilinearXY,
  PropagateConstants_LoadShortVectorLinear,
  PropagateConstants_LoadShortVectorBilinearUV,
  PropagateConstants_LoadShortVectorBilinearXY,
  PropagateConstants_LoadVectorLinear,
  PropagateConstants_LoadVectorBilinearUV,
  PropagateConstants_LoadVectorBilinearXY,
  PropagateConstants_LoadPixelLinear,
  PropagateConstants_LoadPixelBilinearUV,
  PropagateConstants_LoadPixelBilinearXY,
  PropagateConstants_LoadPixelZLinear,
  PropagateConstants_LoadPixelZBilinearUV,
  PropagateConstants_LoadPixelZBilinearXY,
  PropagateConstants_StoreScalarAbsolute,
  PropagateConstants_StoreScalarControlRegisterAbsolute,
  PropagateConstants_StoreShortVectorAbsolute,
  PropagateConstants_StoreVectorAbsolute,
  PropagateConstants_StoreVectorControlRegisterAbsolute,
  PropagateConstants_StorePixelAbsolute,
  PropagateConstants_StorePixelZAbsolute,
  PropagateConstants_StoreScalarLinear,
  PropagateConstants_StoreScalarBilinearUV,
  PropagateConstants_StoreScalarBilinearXY,
  PropagateConstants_StoreShortVectorLinear,
  PropagateConstants_StoreShortVectorBilinearUV,
  PropagateConstants_StoreShortVectorBilinearXY,
  PropagateConstants_StoreVectorLinear,
  PropagateConstants_StoreVectorBilinearUV,
  PropagateConstants_StoreVectorBilinearXY,
  PropagateConstants_StorePixelLinear,
  PropagateConstants_StorePixelBilinearUV,
  PropagateConstants_StorePixelBilinearXY,
  PropagateConstants_StorePixelZLinear,
  PropagateConstants_StorePixelZBilinearUV,
  PropagateConstants_StorePixelZBilinearXY,
  PropagateConstants_StoreScalarControlRegisterImmediate,
  PropagateConstants_StoreScalarImmediate,
  //Misc
  PropagateConstants_StoreScalarRegisterConstant,
  PropagateConstants_StoreMiscRegisterConstant,
  PropagateConstants_PacketStart,
  PropagateConstants_PacketEnd,
};
