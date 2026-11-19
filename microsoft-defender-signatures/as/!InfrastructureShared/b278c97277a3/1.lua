-- Threat: !InfrastructureShared
-- Name: b278c97277a3
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
