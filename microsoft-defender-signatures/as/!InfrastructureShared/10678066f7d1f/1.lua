-- Threat: !InfrastructureShared
-- Name: 10678066f7d1f
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
