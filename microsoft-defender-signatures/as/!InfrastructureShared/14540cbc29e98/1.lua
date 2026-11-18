-- Threat: !InfrastructureShared
-- Name: 14540cbc29e98
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
