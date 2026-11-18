-- Threat: !InfrastructureShared
-- Name: 5fd763d750de
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0, "T1490", "inhibit_winre_recovery")
return mp.INFECTED
