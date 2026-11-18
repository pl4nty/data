-- Threat: !InfrastructureShared
-- Name: 1654008c37f3f
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
