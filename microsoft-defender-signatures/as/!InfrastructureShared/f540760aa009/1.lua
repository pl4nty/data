-- Threat: !InfrastructureShared
-- Name: f540760aa009
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
