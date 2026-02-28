local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1570"
L4_1 = "LateralMovement_LateralToolTransfer_FTPFileDrop"
L1_1(L2_1, L3_1, L4_1)
L1_1 = addRelatedProcess
L1_1()
L1_1 = reportRelatedBmHits
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
