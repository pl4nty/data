local L0_1, L1_1, L2_1, L3_1, L4_1
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
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1490"
L4_1 = "Impact_InhibitSystemRecovery_virsh"
L1_1(L2_1, L3_1, L4_1)
L1_1 = addRelatedProcess
L1_1()
L1_1 = reportRelatedBmHits
L1_1()
L1_1 = IsTaintedProcessinParentTreeForLinux
L2_1 = "upx_file_created_taint"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = IsTaintedProcessinParentTreeForLinux
  L2_1 = "remote_file_created_taint"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = IsTaintedProcessinParentTreeForLinux
    L2_1 = "masqueraded_file_extension_taint"
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = IsTaintedProcessinParentTreeForLinux
      L2_1 = "mounted_file_execution"
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        goto lbl_53
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_53::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
