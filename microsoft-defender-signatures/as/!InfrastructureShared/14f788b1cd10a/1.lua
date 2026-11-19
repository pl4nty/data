-- Threat: !InfrastructureShared
-- Name: 14f788b1cd10a
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
