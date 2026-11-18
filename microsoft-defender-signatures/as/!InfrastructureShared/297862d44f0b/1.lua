-- Threat: !InfrastructureShared
-- Name: 297862d44f0b
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
