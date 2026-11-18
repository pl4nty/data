-- Threat: !InfrastructureShared
-- Name: 1b54043bddc60
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
