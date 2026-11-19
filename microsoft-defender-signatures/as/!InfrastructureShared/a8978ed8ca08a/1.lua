-- Threat: !InfrastructureShared
-- Name: a8978ed8ca08a
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
