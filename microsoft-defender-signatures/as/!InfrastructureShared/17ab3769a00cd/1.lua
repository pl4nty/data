-- Threat: !InfrastructureShared
-- Name: 17ab3769a00cd
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
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_0 ~= nil and (string.match(l_0_0, "^/srv/ftp/") or string.match(l_0_0, "^/mnt/")) then
  bm.trigger_sig("BMExecutionFromScriptInAddSuspLocation", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
