-- Threat: !InfrastructureShared
-- Name: c540f9ab903d
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
