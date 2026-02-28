local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = 1800000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsLegacyOrgMachine
L1_1 = L1_1()
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "MpNewlyCreatedHint_2h"
L1_1[1] = L2_1
L2_1 = ".ps1"
L3_1 = bm_AddRelatedFileFromCommandLine
L4_1 = "BM"
L5_1 = L2_1
L6_1 = nil
L7_1 = 35
L8_1 = L1_1
L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
