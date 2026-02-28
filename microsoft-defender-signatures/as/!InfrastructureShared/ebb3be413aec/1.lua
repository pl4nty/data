local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = L2_1.ppid
  if L3_1 ~= nil then
    goto lbl_28
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_28::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L2_1.image_path
L4_1 = L4_1(L5_1)
L5_1 = L1_1.command_line
L6_1 = mp
L6_1 = L6_1.GetProcessCommandLine
L7_1 = L2_1.ppid
L6_1 = L6_1(L7_1)
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1
L9_1 = "/tmp/.SummitLxAssetAgent.users.tmp"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 ~= nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = AppendToRollingQueue
L8_1 = L0_1
L9_1 = "scr_image_path"
L10_1 = L3_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = AppendToRollingQueue
L8_1 = L0_1
L9_1 = "scr_process_cmdline"
L10_1 = L5_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = AppendToRollingQueue
L8_1 = L0_1
L9_1 = "scr_parent_image_path"
L10_1 = L4_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = AppendToRollingQueue
L8_1 = L0_1
L9_1 = "scr_parent_process_cmdline"
L10_1 = L6_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = TrackPidAndTechniqueBM
L8_1 = "BM"
L9_1 = "T1074"
L10_1 = "Collection_Redirection_mt2023"
L11_1 = 300
L7_1(L8_1, L9_1, L10_1, L11_1)
L7_1 = reportRelatedBmHits
L7_1()
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
