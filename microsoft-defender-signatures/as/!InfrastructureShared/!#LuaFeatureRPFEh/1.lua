local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
L1_1 = L1_1(L2_1)
if L1_1 ~= true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetMOTWZone
L1_1 = L1_1()
if not L1_1 or L1_1 < 3 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetCertificateInfo
L2_1 = L2_1()
if L2_1 then
  L3_1 = next
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_50
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_50::
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "MpInternal_FeatureRPFMsvcEh"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.set_mpattributeex
L4_1 = "RPF:MSVC:FunctionSizeThreshold"
L5_1 = 16384
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.set_mpattributeex
L4_1 = "RPF:MSVC:FunctionStackThreshold"
L5_1 = 1024
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "MpInternal_FeatureRPFDwarfEh"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.set_mpattributeex
L4_1 = "RPF:DWARF:FunctionSizeThreshold"
L5_1 = 16384
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
