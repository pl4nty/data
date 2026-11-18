-- Threat: !InfrastructureShared
-- Name: 65403a3b5a5d
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
