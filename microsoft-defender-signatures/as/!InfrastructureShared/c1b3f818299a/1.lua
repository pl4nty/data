-- Threat: !InfrastructureShared
-- Name: c1b3f818299a
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("FirstLogonUser") then
  return mp.INFECTED
end
return mp.CLEAN
