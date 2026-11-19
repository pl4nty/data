-- Threat: !InfrastructureShared
-- Name: 8bb3a22fe2c7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil)
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1021.002", "proc_launch_from_share")
  return mp.INFECTED
end
return mp.CLEAN
