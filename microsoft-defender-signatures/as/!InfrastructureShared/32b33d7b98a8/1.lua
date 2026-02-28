local L0_1, L1_1, L2_1, L3_1
L0_1 = IsTaintedProcessinParentTreeForLinux
L1_1 = "upx_file_created_taint"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = IsTaintedProcessinParentTreeForLinux
  L1_1 = "remote_file_created_taint"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = IsTaintedProcessinParentTreeForLinux
    L1_1 = "masqueraded_file_extension_taint"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = IsTaintedProcessinParentTreeForLinux
      L1_1 = "mounted_file_execution"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_33
      end
    end
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1570"
L3_1 = "LateralMovement_LateralToolTransfer_SuspFileCreateFTP"
L0_1(L1_1, L2_1, L3_1)
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_33::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
