-- Threat: !InfrastructureShared
-- Name: 51b384332fbf
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1490", "tt_remediate")
  return mp.INFECTED
end
return mp.CLEAN
