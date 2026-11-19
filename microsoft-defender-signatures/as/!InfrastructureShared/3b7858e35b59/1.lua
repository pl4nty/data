-- Threat: !InfrastructureShared
-- Name: 3b7858e35b59
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
