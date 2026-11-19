-- Threat: !InfrastructureShared
-- Name: 41b3a355efa7
-- Type: 21

if this_sigattrlog[2].matched then
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1), 2416696475)
end
return mp.INFECTED
