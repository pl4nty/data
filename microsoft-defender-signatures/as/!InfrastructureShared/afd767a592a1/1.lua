-- Threat: !InfrastructureShared
-- Name: afd767a592a1
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("credentialdumping_concrete") then
  return mp.INFECTED
end
return mp.CLEAN
