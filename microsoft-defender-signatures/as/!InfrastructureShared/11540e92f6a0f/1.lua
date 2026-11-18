-- Threat: !InfrastructureShared
-- Name: 11540e92f6a0f
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
