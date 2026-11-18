-- Threat: !InfrastructureShared
-- Name: 89b3360df57b
-- Type: 21

if this_sigattrlog[5].matched then
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p1), 1015510199)
else
  mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p1), 377825792)
end
return mp.INFECTED
