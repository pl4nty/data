-- Threat: !InfrastructureShared
-- Name: df780808a6d2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
