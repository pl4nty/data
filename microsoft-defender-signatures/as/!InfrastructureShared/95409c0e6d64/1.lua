-- Threat: !InfrastructureShared
-- Name: 95409c0e6d64
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
