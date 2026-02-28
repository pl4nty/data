local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.ppid
    if L1_1 ~= "" then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = versioning
L1_1 = L1_1.GetCloudBlockLevel
L1_1 = L1_1()
if 4 <= L1_1 then
  L1_1 = CheckIfProcessTreePartOfTaintExecution
  L2_1 = L0_1.ppid
  L3_1 = 5
  L4_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 then
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1048"
    L4_1 = "Exfiltration_Archive"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = addRelatedProcess
    L1_1()
    L1_1 = reportRelatedBmHits
    L1_1()
    L1_1 = RemediateProcessTreeForLinux
    L1_1()
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
