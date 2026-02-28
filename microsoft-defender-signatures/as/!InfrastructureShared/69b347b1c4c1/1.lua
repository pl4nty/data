local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L0_1 = L2_1.utf8p1
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L1_1 = L2_1.ppid
else
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = isParentPackageManager
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_file
  L3_1 = L0_1
  L2_1(L3_1)
end
if L1_1 ~= nil then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L1_1
  L4_1 = "T1053.003"
  L5_1 = "Persistence"
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = addRelatedProcess
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
