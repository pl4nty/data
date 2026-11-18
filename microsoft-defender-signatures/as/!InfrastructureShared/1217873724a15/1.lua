-- Threat: !InfrastructureShared
-- Name: 1217873724a15
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
