-- Threat: !InfrastructureShared
-- Name: 41b30fc091f2
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[1].ppid
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_2 = IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_0, true)
if l_0_2 then
  TrackPidAndTechniqueBM(l_0_1, "T1021.002", "remoteservice-target")
  return mp.INFECTED
end
return mp.CLEAN
