-- Threat: !InfrastructureShared
-- Name: !#Lua:LegacyOrgMachine
-- Type: 12
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() == true then
  mp.set_mpattribute("Lua:TTExclusion")
  return mp.INFECTED
end
mp.set_mpattribute("Lua:IsNotLegacyOrgMachine")
return mp.CLEAN
