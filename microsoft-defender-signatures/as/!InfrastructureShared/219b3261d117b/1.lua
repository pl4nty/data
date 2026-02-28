local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "((%d+)%.(%d+)%.(%d+)%.(%d+))"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "[http://][https://][http://www.][https://www.]+%w+%.%w+[/%w%.]+"
L3_1 = L3_1(L4_1, L5_1)
if L2_1 or L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
