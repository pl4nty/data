local L0_1, L1_1, L2_1, L3_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "Capfetox"
L3_1 = "Capfetox_tagged"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
