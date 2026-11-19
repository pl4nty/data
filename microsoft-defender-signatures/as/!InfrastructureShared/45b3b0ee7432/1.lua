-- Threat: !InfrastructureShared
-- Name: 45b3b0ee7432
-- Type: 21
-- Includes: TechniqueTracker

if IsTacticObservedGlobal("uac_bypass") then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
