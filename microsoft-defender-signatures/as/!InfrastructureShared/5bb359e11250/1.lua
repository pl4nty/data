local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.ppid
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "8223363f%-34f3%-4cff%-b4f2%-6d0d4b9a4dbc"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
