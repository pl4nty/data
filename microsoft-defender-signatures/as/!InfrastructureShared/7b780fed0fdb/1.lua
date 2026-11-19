-- Threat: !InfrastructureShared
-- Name: 7b780fed0fdb
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
