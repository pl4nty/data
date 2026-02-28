local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "((%d+)%.(%d+)%.(%d+)%.(%d+))"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
