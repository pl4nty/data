-- Threat: !InfrastructureShared
-- Name: 2d780b6d9dc5
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
