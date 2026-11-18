-- Threat: !InfrastructureShared
-- Name: b9b345cd6641
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  bm_AddRelatedFileFromCommandLine(l_0_1.command_line, nil, nil, 1)
  TrackPidAndTechniqueBM(l_0_1.ppid, "T1562.001", "psver2_amsi_bypass")
end
return mp.INFECTED
