-- Threat: !InfrastructureShared
-- Name: 11fb313794be2
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
if l_0_0 then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  if IsKeyInRollingQueue("DllSideloadMonitor", l_0_0, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
