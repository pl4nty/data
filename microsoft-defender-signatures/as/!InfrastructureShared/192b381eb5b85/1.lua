local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[7]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[7]
    L0_1 = L1_1.utf8p1
  end
end
L1_1 = {}
L2_1 = "program files"
L1_1[1] = L2_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1048"
L5_1 = "Exfiltration_Archive"
L2_1(L3_1, L4_1, L5_1)
L2_1 = addOverallNetworkVolume
L2_1()
L2_1 = reportSessionInformation
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
