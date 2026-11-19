-- Threat: !InfrastructureShared
-- Name: 9378940b4da8
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
