-- Threat: !InfrastructureShared
-- Name: 3a785102aaa5
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
