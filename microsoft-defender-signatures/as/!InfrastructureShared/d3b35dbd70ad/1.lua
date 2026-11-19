-- Threat: !InfrastructureShared
-- Name: d3b35dbd70ad
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
bm_AddRelatedFileFromCommandLine("BM", nil, nil, 6)
return mp.INFECTED
