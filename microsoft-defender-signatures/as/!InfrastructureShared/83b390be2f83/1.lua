-- Threat: !InfrastructureShared
-- Name: 83b390be2f83
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("uac_bypass") then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
