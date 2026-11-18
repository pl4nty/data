-- Threat: !InfrastructureShared
-- Name: 9378e806e1a0
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
