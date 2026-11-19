-- Threat: !InfrastructureShared
-- Name: 32787b579d8a
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
