local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[14]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[14]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[14]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = " stop"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1489"
L4_1 = "Impact_ServiceStop"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
