local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L0_1 = L1_1.utf8p1
  end
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.ppid
    if L2_1 ~= "" and L0_1 ~= nil and L0_1 ~= "" then
      goto lbl_32
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_32::
L2_1 = TrackPidAndTechniqueBM
L3_1 = L1_1.ppid
L4_1 = "T1560.001"
L5_1 = "Collection_ArchiveViaUtility_TAR"
L2_1(L3_1, L4_1, L5_1)
L2_1 = bm
L2_1 = L2_1.trigger_sig
L3_1 = "FileArchiving"
L4_1 = L0_1
L2_1(L3_1, L4_1)
L2_1 = addRelatedProcess
L2_1()
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
