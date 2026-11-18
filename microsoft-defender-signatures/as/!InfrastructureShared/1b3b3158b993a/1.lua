-- Threat: !InfrastructureShared
-- Name: 1b3b3158b993a
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\SYSTEM32\\tasks") .. l_0_0)
if not sysio.IsFileExists(l_0_1) then
  return mp.CLEAN
end
if versioning.GetCloudBlockLevel() == 4 then
  mp.TriggerScanResource("taskscheduler", l_0_1)
end
return mp.INFECTED
