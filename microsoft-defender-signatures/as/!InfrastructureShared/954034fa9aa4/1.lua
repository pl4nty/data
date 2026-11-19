-- Threat: !InfrastructureShared
-- Name: 954034fa9aa4
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
