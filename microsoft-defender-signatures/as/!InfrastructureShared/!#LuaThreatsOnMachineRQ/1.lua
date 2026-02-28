local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = 10800
L1_1 = 10
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "Detection:HackTool:"
L2_1 = L2_1(L3_1)
L3_1 = #L2_1
if 0 < L3_1 then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = AppendToRollingQueue
    L9_1 = "ThreatsOnMachine_Lua"
    L10_1 = L7_1
    L11_1 = 1
    L12_1 = L0_1
    L13_1 = L1_1
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
  end
end
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "Detection:Trojan:"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = #L2_1
if 0 < L3_1 then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = AppendToRollingQueue
    L9_1 = "ThreatsOnMachine_Lua"
    L10_1 = L7_1
    L11_1 = 1
    L12_1 = L0_1
    L13_1 = L1_1
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
  end
end
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "Detection:"
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = #L2_1
if 0 < L3_1 then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = AppendToRollingQueue
    L9_1 = "RecentThreatsOnMachine"
    L10_1 = L7_1
    L11_1 = 5
    L12_1 = 1800
    L13_1 = 100
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
