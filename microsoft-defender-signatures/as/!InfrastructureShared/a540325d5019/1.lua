-- Threat: !InfrastructureShared
-- Name: a540325d5019
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
