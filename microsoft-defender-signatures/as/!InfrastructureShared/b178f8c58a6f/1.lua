-- Threat: !InfrastructureShared
-- Name: b178f8c58a6f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
