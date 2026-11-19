-- Threat: !InfrastructureShared
-- Name: 1f7b3a371d3f3
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_1:find("enableaslr.ps1", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("microsoft.office.datacenter.kevlar", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("microsoft.m365.cosmic.compute.windows.node", 1, true) then
    return mp.CLEAN
  end
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  AddResearchData(l_0_0.ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
