-- Threat: !InfrastructureShared
-- Name: 65401f4d8ca7
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
