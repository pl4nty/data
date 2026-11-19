-- Threat: !InfrastructureShared
-- Name: 53783c6e7b60
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
