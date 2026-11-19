-- Threat: !InfrastructureShared
-- Name: 6540fc2971df
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
