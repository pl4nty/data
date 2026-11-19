-- Threat: !InfrastructureShared
-- Name: 31b361c1d523
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
return mp.INFECTED
