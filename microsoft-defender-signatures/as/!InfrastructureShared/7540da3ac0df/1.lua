-- Threat: !InfrastructureShared
-- Name: 7540da3ac0df
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
