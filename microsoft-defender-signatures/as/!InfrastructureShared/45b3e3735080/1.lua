-- Threat: !InfrastructureShared
-- Name: 45b3e3735080
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.ppid == nil or string.find(l_0_0.ppid, "pid:4$", 1, false) ~= nil or string.find(l_0_0.ppid, "pid:4,", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
if l_0_0.integrity_level >= l_0_1.IntegrityLevel then
  return mp.CLEAN
end
return mp.INFECTED
