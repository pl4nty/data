-- Threat: !InfrastructureShared
-- Name: 2c9b3e1443ce5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[8].utf8p2)
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[9].utf8p2)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[10].utf8p2)
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[11].utf8p2)
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[12].utf8p2)
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[13].utf8p2)
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[14].utf8p2)
end
if l_0_1 == nil or #l_0_1 < 500 then
  return mp.CLEAN
end
if 500 <= #l_0_1 then
  bm.trigger_sig("RunningLargeShellContentInCmd_GT500", l_0_1)
end
if 1000 <= #l_0_1 then
  bm.trigger_sig("RunningLargeShellContentInCmd_GT1000", l_0_1)
end
if 1500 <= #l_0_1 then
  bm.trigger_sig("RunningLargeShellContentInCmd_GT1500", l_0_1)
end
if 2000 <= #l_0_1 then
  bm.trigger_sig("RunningLargeShellContentInCmd_GT2000", l_0_1)
end
if 2500 <= #l_0_1 then
  bm.trigger_sig("RunningLargeShellContentInCmd_GT2500", l_0_1)
end
return mp.INFECTED
