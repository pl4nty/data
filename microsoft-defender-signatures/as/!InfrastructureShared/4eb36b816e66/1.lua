-- Threat: !InfrastructureShared
-- Name: 4eb36b816e66
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("processinjection_source_dridex", true) or IsTacticObservedGlobal("processinjection_target_dridex", true) then
  return mp.INFECTED
end
return mp.CLEAN
