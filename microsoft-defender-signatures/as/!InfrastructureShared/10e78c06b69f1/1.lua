-- Threat: !InfrastructureShared
-- Name: 10e78c06b69f1
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
