-- Threat: !InfrastructureShared
-- Name: 5f78c5542e84
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
