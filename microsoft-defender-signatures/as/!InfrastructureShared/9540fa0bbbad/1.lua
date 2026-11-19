-- Threat: !InfrastructureShared
-- Name: 9540fa0bbbad
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
