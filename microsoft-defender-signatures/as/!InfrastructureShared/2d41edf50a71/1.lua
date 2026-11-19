-- Threat: !InfrastructureShared
-- Name: 2d41edf50a71
-- Type: 21

local l_0_0 = {
  EnforcementLevelP1 = this_sigattrlog[1].np1,
  EnforcementLevelP2 = this_sigattrlog[1].np2,
  Determination = this_sigattrlog[2].utf8p1
}
nri.AddTelemetry(0, l_0_0)
return mp.INFECTED
