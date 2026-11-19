-- Threat: !InfrastructureShared
-- Name: 4fd749c70427
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("TamperingAlerts_LimitedSet_A")
if l_0_0 ~= nil then
  set_research_data("ThreatsOnMachine", "[" .. table.concat(l_0_0, "|") .. "]", false)
  return mp.LOWFI
end
return mp.CLEAN
