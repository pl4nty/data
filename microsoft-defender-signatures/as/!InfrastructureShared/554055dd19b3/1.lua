-- Threat: !InfrastructureShared
-- Name: 554055dd19b3
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
