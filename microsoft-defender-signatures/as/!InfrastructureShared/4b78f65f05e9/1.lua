-- Threat: !InfrastructureShared
-- Name: 4b78f65f05e9
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
