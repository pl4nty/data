local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = "MpUefiGrubCheck"
L1_1 = "MpUefiGrubCfg"
L2_1 = "MpUefiSuspTxt"
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContextNoPath
L4_1 = L0_1
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContextNoPath
  L4_1 = L0_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
