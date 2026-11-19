-- Threat: !InfrastructureShared
-- Name: 8d78cd27176d
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
