-- Threat: !InfrastructureShared
-- Name: 5bb302ef76ae
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTacticObservedGlobal("FirstLogonUser") then
  reportSessionInformation()
  addOverallNetworkVolume()
  return mp.INFECTED
end
return mp.CLEAN
