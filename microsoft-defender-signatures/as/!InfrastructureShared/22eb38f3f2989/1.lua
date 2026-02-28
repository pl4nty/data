local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[10]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[11]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[11]
      L0_1 = L1_1.utf8p1
    end
  end
end
if L0_1 ~= nil then
  L1_1 = isTainted
  L2_1 = L0_1
  L3_1 = "new_script_file_created_hint"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = isTainted
    L2_1 = L0_1
    L3_1 = "new_archive_file_created_hint"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = isTainted
      L2_1 = L0_1
      L3_1 = "new_elf_file_created_hint"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        goto lbl_71
      end
    end
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
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1105"
  L4_1 = "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = bm
  L1_1 = L1_1.trigger_sig
  L2_1 = "RemoteFileCopy"
  L3_1 = L0_1
  L1_1(L2_1, L3_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_71::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
