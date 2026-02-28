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
      goto lbl_28
    end
  end
end
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1048"
L3_1 = "Exfiltration_ExfiltrationOverAlternativeProtocol_StagedSenitiveDataExfil"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_28::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
