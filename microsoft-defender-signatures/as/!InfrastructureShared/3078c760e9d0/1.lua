-- Threat: !InfrastructureShared
-- Name: 3078c760e9d0
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
