-- Threat: !InfrastructureShared
-- Name: 4d78a749da27
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.dt_error_heur_exit_criteria then
  return mp.CLEAN
end
return mp.INFECTED
