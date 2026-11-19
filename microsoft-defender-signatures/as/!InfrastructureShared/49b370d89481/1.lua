-- Threat: !InfrastructureShared
-- Name: 49b370d89481
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  bm_AddRelatedFileFromCommandLine(l_0_1.command_line, nil, nil, 1)
  TrackPidAndTechniqueBM(l_0_1.ppid, "T1059.001", "amsi_bypass")
end
return mp.INFECTED
