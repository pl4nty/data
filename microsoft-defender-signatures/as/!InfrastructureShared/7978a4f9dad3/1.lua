-- Threat: !InfrastructureShared
-- Name: 7978a4f9dad3
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
