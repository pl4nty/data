local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[34]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[34]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[34]
    L1_1 = L2_1.utf8p1
  end
end
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1560"
L5_1 = "Collection_ArchiveData"
L2_1(L3_1, L4_1, L5_1)
L2_1 = bm
L2_1 = L2_1.add_related_file
L3_1 = L1_1
L2_1(L3_1)
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "archivepath"
L4_1 = L1_1
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = addRelatedProcess
L2_1()
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
