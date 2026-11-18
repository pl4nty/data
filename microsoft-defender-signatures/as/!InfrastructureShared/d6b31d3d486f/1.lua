-- Threat: !InfrastructureShared
-- Name: d6b31d3d486f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = MpCommon.RollingQueueCount("TamperingAlerts")
local l_0_1 = GetRollingQueueKeys("TamperingAlerts_LimitedSet_A")
local l_0_2 = GetRollingQueueKeys("TamperingAlerts_LimitedSet_B")
if l_0_0 ~= nil and 4 <= l_0_0 then
  return mp.INFECTED
end
if l_0_1 ~= nil or l_0_2 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
