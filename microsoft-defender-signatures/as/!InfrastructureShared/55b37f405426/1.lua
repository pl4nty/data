-- Threat: !InfrastructureShared
-- Name: 55b37f405426
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
bm_AddRelatedFileFromCommandLine("BM")
return mp.INFECTED
