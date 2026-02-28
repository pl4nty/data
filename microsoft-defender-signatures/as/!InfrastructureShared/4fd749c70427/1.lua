local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = GetRollingQueueKeys
L1_1 = "TamperingAlerts_LimitedSet_A"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = set_research_data
  L2_1 = "ThreatsOnMachine"
  L3_1 = "["
  L4_1 = table
  L4_1 = L4_1.concat
  L5_1 = L0_1
  L6_1 = "|"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = "]"
  L3_1 = L3_1 .. L4_1 .. L5_1
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.LOWFI
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
