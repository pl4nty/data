-- Threat: !InfrastructureShared
-- Name: 25b3c24e08a2
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  TrackPidAndTechniqueBM("BM", "T1561.002", "folderguard_blk")
  return mp.INFECTED
end
return mp.CLEAN
