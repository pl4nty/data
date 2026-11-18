-- Threat: !InfrastructureShared
-- Name: 55b3213af18c
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
bm_AddRelatedFileFromCommandLine("BM")
return mp.INFECTED
