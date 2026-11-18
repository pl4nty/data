-- Threat: !InfrastructureShared
-- Name: 8ab3a1988f07
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
l_0_0 = l_0_1.ppid
TrackPidAndTechniqueBM(l_0_0, "T1562.002", "event_logger_disable")
return mp.INFECTED
