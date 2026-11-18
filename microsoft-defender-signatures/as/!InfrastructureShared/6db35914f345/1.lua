-- Threat: !InfrastructureShared
-- Name: 6db35914f345
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
return mp.INFECTED
