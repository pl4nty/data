local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 150000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = TrackCustomPersistContextNameByPPID
L1_1 = "set"
L2_1 = "bm"
L3_1 = "MimikatzTrigger"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
