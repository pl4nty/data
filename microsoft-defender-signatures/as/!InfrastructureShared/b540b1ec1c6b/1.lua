-- Threat: !InfrastructureShared
-- Name: b540b1ec1c6b
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
