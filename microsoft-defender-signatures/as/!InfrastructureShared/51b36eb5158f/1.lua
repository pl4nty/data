-- Threat: !InfrastructureShared
-- Name: 51b36eb5158f
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
return mp.INFECTED
