local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "srtasks.exe"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "executescheduledsppcreation"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_29
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = IsTechniqueObservedGlobal
L3_1 = "T1003"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = IsTacticObservedGlobal
  L3_1 = "shadowcopy_create"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
