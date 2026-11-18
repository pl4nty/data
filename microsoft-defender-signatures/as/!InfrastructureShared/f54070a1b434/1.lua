-- Threat: !InfrastructureShared
-- Name: f54070a1b434
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
