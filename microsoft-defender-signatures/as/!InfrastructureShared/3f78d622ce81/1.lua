-- Threat: !InfrastructureShared
-- Name: 3f78d622ce81
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
