-- Threat: !InfrastructureShared
-- Name: 5ab78097db225
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
