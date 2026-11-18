-- Threat: !InfrastructureShared
-- Name: 21b301d2923a
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = "remote_file_created_taint"
local l_0_1 = "queue_pid_taintfactory_a"
local l_0_2, l_0_3
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p1
  l_0_3 = this_sigattrlog[1].ppid
end
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = IsKeyInRollingQueue(l_0_1, l_0_3, true)
if l_0_4 then
  taint(l_0_2, l_0_0, 3600)
end
return mp.CLEAN
