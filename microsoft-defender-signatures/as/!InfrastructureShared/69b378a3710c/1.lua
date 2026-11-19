-- Threat: !InfrastructureShared
-- Name: 69b378a3710c
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
return mp.INFECTED
