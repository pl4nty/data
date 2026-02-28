local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_29
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
goto lbl_37
::lbl_29::
L3_1 = bm
L3_1 = L3_1.trigger_sig
L4_1 = "BmTraverseTreeBlockMac"
L5_1 = "Detected"
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_37::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
