-- Threat: !InfrastructureShared
-- Name: 53d787c201e4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  T1041 = "exfiltration_c2",
  T1082 = "exfiltration_systeminfo",
  T1539 = "exfiltration_browser"
}
TrackPidAndMultipleTechniques("CMDHSTR", l_0_0)
return mp.INFECTED
