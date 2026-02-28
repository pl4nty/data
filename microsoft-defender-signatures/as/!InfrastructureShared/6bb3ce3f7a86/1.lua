local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = "sensitive_cat_redirection"
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.ppid
    if L2_1 ~= "" then
      goto lbl_16
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_16::
L2_1 = GetTacticsTableForPid
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 0
L4_1 = pairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L7_1
  L11_1 = "mt2023"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L3_1 = L3_1 + 1
  end
end
if 2 < L3_1 then
  L4_1 = GetRollingQueueAsHashTable
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  L5_1 = ""
  L6_1 = ""
  L7_1 = ""
  L8_1 = ""
  if L4_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = L4_1.scr_image_path
  if L9_1 ~= nil then
    L5_1 = L4_1.scr_image_path
  end
  L9_1 = L4_1.scr_process_cmdline
  if L9_1 ~= nil then
    L6_1 = L4_1.scr_process_cmdline
  end
  L9_1 = L4_1.scr_parent_image_path
  if L9_1 ~= nil then
    L7_1 = L4_1.scr_parent_image_path
  end
  L9_1 = L4_1.scr_parent_process_cmdline
  if L9_1 ~= nil then
    L8_1 = L4_1.scr_parent_process_cmdline
  end
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "scr_image_path"
  L11_1 = L5_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "scr_process_cmdline"
  L11_1 = L6_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "scr_parent_image_path"
  L11_1 = L7_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "scr_parent_process_cmdline"
  L11_1 = L8_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = reportRelatedBmHits
  L9_1()
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
