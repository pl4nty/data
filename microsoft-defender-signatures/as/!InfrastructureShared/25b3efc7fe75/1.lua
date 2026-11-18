-- Threat: !InfrastructureShared
-- Name: 25b3efc7fe75
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
if IsDetectionThresholdMet(l_0_0.ppid) then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  AddResearchData(l_0_0.ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
