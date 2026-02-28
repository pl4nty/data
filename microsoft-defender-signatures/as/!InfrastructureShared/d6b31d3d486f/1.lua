local L0_1, L1_1, L2_1, L3_1
L0_1 = MpCommon
L0_1 = L0_1.RollingQueueCount
L1_1 = "TamperingAlerts"
L0_1 = L0_1(L1_1)
L1_1 = GetRollingQueueKeys
L2_1 = "TamperingAlerts_LimitedSet_A"
L1_1 = L1_1(L2_1)
L2_1 = GetRollingQueueKeys
L3_1 = "TamperingAlerts_LimitedSet_B"
L2_1 = L2_1(L3_1)
if L0_1 ~= nil and 4 <= L0_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
if L1_1 ~= nil or L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
