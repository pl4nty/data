-- Threat: !InfrastructureShared
-- Name: 91b3e922204f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.command_line ~= nil and l_0_0.ppid ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 4)
  AddResearchData(l_0_0.ppid, true)
end
return mp.INFECTED
