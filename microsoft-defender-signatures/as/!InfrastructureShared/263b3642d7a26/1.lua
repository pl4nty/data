local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "ImagePath"
  L3_1 = L0_1
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1486"
  L4_1 = "Impact_FileEncryption"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  if L1_1 == nil then
    L2_1 = L1_1.ppid
    if L2_1 == nil then
      goto lbl_36
    end
  end
  L2_1 = TerminateParentProcessForLinux
  L3_1 = L1_1.ppid
  L4_1 = 2
  L2_1(L3_1, L4_1)
  ::lbl_36::
  L2_1 = bm
  L2_1 = L2_1.get_process_relationships
  L2_1, L3_1 = L2_1()
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = bm
    L9_1 = L9_1.trigger_sig
    L10_1 = "BmTraverseTreeBlock"
    L11_1 = "Detected"
    L12_1 = L8_1.ppid
    L9_1(L10_1, L11_1, L12_1)
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
