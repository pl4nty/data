-- Threat: !InfrastructureShared
-- Name: 55b3c5b61e58
-- Type: 21

if this_sigattrlog[2].matched then
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1), 644432144)
end
return mp.INFECTED
