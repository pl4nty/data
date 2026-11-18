-- Threat: !InfrastructureShared
-- Name: 4178928b1bc3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
