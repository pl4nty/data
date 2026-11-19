-- Threat: !InfrastructureShared
-- Name: 9f7870fe3dd6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
