-- Threat: !InfrastructureShared
-- Name: 3278a9855f32
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
