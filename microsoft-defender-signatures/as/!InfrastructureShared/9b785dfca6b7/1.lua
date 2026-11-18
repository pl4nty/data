-- Threat: !InfrastructureShared
-- Name: 9b785dfca6b7
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
