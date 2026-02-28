local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p2
end
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = taint
L2_1 = L0_1
L3_1 = "remote_file_created_taint"
L4_1 = 3600
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.ReportLowfi
L2_1 = L0_1
L3_1 = 3672992343
L1_1(L2_1, L3_1)
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = addRelatedProcess
L1_1()
L1_1 = reportRelatedBmHits
L1_1()
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1105"
L4_1 = "CommandAndControl_IngressToolTransfer_RemoteFileCopyELF"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
