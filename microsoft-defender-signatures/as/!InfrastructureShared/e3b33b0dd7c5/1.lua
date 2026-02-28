local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
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
          goto lbl_40
        end
      end
    end
  end
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1552.003"
  L4_1 = "CredentialAccess_UnsecuredCredentials_BashHistory"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_40::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
