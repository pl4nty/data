-- Threat: !InfrastructureShared
-- Name: 10db364b99212
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info().ppid
if l_0_0 ~= nil then
  local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
  if l_0_1 ~= nil and 12 < #l_0_1 then
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "\\ubu_statistikautostart.vbs", 1, true) ~= nil then
      return mp.CLEAN
    end
  end
end
AddResearchData("BM", true)
bm_AddRelatedFileFromCommandLine("BM", nil, nil, 6)
return mp.INFECTED
