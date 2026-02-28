local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = string
L2_1 = L2_1.lower
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1, L4_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1)
if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    goto lbl_35
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_35::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
