-- Threat: !InfrastructureShared
-- Name: 1d9b3f8c3772c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTechniqueObservedGlobal("ReverseShell", true) then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
