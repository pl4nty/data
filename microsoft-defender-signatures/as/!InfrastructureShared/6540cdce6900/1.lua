-- Threat: !InfrastructureShared
-- Name: 6540cdce6900
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
