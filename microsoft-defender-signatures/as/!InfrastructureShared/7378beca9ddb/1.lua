-- Threat: !InfrastructureShared
-- Name: 7378beca9ddb
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
