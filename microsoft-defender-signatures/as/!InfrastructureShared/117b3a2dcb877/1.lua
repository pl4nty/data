local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p1
end
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
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
      goto lbl_59
    end
  end
end
L1_1 = taint
L2_1 = L0_1
L3_1 = "remote_file_created_taint"
L4_1 = 3600
L1_1(L2_1, L3_1, L4_1)
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = bm
L1_1 = L1_1.trigger_sig
L2_1 = "PossibleNonElfDownload"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = addRelatedProcess
L1_1()
L1_1 = reportRelatedBmHits
L1_1()
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1105"
L4_1 = "CommandAndControl_IngressToolTransfer_RemoteFileCopy"
L1_1(L2_1, L3_1, L4_1)
goto lbl_120
::lbl_59::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "([^/]+)$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "(%.[^%.%s]+)%s*$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil or L2_1 ~= "" then
  L3_1 = {}
  L3_1[".doc"] = true
  L3_1[".xls"] = true
  L3_1[".mp3"] = true
  L3_1[".mp4"] = true
  L3_1[".jpg"] = true
  L3_1[".jpeg"] = true
  L3_1[".exe"] = true
  L3_1[".html"] = true
  L3_1[".docx"] = true
  L3_1[".xlsx"] = true
  L4_1 = L2_1.lower
  L4_1 = L4_1()
  L2_1 = L4_1
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = taint
    L5_1 = L0_1
    L6_1 = "remote_file_created_taint"
    L7_1 = 3600
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = bm
    L4_1 = L4_1.add_related_file
    L5_1 = L0_1
    L4_1(L5_1)
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "PossibleNonElfDownload"
    L6_1 = L0_1
    L4_1(L5_1, L6_1)
    L4_1 = addRelatedProcess
    L4_1()
    L4_1 = reportRelatedBmHits
    L4_1()
    L4_1 = TrackPidAndTechniqueBM
    L5_1 = "BM"
    L6_1 = "T1105"
    L7_1 = "CommandAndControl_IngressToolTransfer_RemoteFileCopy"
    L4_1(L5_1, L6_1, L7_1)
  end
end
::lbl_120::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
