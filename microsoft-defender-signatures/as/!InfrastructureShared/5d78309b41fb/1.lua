-- Threat: !InfrastructureShared
-- Name: 5d78309b41fb
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
