-- Threat: !InfrastructureShared
-- Name: 1a3b3289f12c0
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = bm.GetProcedureMatchDuration(0)
local l_0_3 = bm.GetProcedureMatchDuration(1)
if l_0_2 > l_0_3 then
  l_0_1 = l_0_2 - l_0_3
else
  l_0_1 = l_0_3 - l_0_2
end
if 20000000 < l_0_1 then
  return mp.CLEAN
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if string.match(l_0_0, "^/home/") or string.match(l_0_0, "^/root/") or string.match(l_0_0, "^/tmp/") or string.match(l_0_0, "^/var/") or string.match(l_0_0, "^/dev/shm/") then
  bm.trigger_sig("BMExecutionFromScriptInSuspLocation", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
