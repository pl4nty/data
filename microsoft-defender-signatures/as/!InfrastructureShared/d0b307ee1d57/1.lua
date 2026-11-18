-- Threat: !InfrastructureShared
-- Name: d0b307ee1d57
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if not string.find(l_0_1, "/opt/oracle.ExaWatcher/GetExaWatcherResults.sh", 1, true) and not string.find(l_0_1, "/var/opt/BESClient/LMT/CIT/", 1, true) and not string.find(l_0_1, "/usr/sbin/recaplog", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1070.006", "DefenseEvasion")
  return mp.INFECTED
end
return mp.CLEAN
