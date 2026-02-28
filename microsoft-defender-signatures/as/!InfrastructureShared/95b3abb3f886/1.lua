local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 then
  L1_1 = {}
  L1_1[".one"] = true
  L1_1[".hta"] = true
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L0_1.command_line
  L4_1 = L1_1
  L5_1 = nil
  L6_1 = 6
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
