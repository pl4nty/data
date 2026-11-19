-- Threat: !InfrastructureShared
-- Name: 8bd75dc69a97
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() then
  return mp.CLEAN
end
return mp.INFECTED
