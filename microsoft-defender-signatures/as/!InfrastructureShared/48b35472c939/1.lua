local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = {}
    L1_1[".dat"] = true
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1.command_line
    L2_1 = L2_1(L3_1)
    L3_1 = bm_AddRelatedFileFromCommandLine
    L4_1 = L2_1
    L5_1 = L1_1
    L6_1 = nil
    L7_1 = 1
    L3_1(L4_1, L5_1, L6_1, L7_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
