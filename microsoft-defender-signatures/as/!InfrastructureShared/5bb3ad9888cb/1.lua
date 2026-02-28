local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = TrackPidAndTechniqueBM
    L1_1 = "BM"
    L2_1 = "T1489"
    L3_1 = "Impact_ServiceStop_postgresql"
    L0_1(L1_1, L2_1, L3_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
