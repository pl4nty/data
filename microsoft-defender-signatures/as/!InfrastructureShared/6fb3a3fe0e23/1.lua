local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.wp2
  if L0_1 == nil then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1018"
L3_1 = "Discovery"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
