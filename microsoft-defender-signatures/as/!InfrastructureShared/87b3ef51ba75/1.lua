-- Threat: !InfrastructureShared
-- Name: 87b3ef51ba75
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("processinjection_source_dridex", true) or IsTacticObservedGlobal("processinjection_target_dridex", true) then
  return mp.INFECTED
end
return mp.CLEAN
