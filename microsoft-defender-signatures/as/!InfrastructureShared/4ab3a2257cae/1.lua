-- Threat: !InfrastructureShared
-- Name: 4ab3a2257cae
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = "remote_file_created_taint"
local l_0_1 = "queue_pid_taintfactory_b"
local l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched then
  l_0_3 = this_sigattrlog[1].utf8p1
  l_0_2 = this_sigattrlog[1].utf8p2
  l_0_4 = this_sigattrlog[1].ppid
end
if not (l_0_2 and l_0_3) or not l_0_4 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = IsKeyInRollingQueue(l_0_1, l_0_4, true)
if l_0_5 or isTainted(l_0_2, l_0_0) then
  taint(l_0_3, l_0_0, 3600)
end
return mp.CLEAN
