-- Threat: !InfrastructureShared
-- Name: 85b351bc4771
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if string.len(l_0_0) < 2048 then
  return mp.CLEAN
end
if string.find(l_0_0, "%.ps1") then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
TrackCustomPersistContextNameByPPID("set", l_0_1.ppid, "MimikatzTrigger")
bm.request_SMS(l_0_1.ppid, "M")
return mp.INFECTED
