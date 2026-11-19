-- Threat: !InfrastructureShared
-- Name: 3f78a732801a
-- Type: 21

if peattributes.isexe and peattributes.amd64_image and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
