-- Threat: !InfrastructureShared
-- Name: 31787c3d2d03
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
