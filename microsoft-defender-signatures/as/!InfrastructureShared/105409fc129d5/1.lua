-- Threat: !InfrastructureShared
-- Name: 105409fc129d5
-- Type: 21

if peattributes.ismsil and peattributes.isexe and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
