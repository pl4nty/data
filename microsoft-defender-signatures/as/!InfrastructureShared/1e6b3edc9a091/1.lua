local L0_1, L1_1, L2_1
L0_1 = GetRollingQueueKeys
L1_1 = "Medicated64Sliver"
L0_1 = L0_1(L1_1)
L1_1 = GetRollingQueueKeys
L2_1 = "Medicated32Sliver"
L1_1 = L1_1(L2_1)
if L0_1 or L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
