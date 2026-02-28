local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = 50000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1486"
L4_1 = "Impact_Encryption"
L1_1(L2_1, L3_1, L4_1)
L1_1 = RemediateProcessTreeForLinux
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
