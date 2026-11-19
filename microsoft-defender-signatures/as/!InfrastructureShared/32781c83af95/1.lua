-- Threat: !InfrastructureShared
-- Name: 32781c83af95
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
