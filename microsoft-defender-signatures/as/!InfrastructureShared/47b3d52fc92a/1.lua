-- Threat: !InfrastructureShared
-- Name: 47b3d52fc92a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_1:find("conhost.exe", 1, true) then
    return mp.CLEAN
  end
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  AddResearchData(l_0_0.ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
