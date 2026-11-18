-- Threat: !InfrastructureShared
-- Name: 5678a0ad7203
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.dt_error_heur_API_limit then
  return mp.CLEAN
end
return mp.INFECTED
