-- Threat: !InfrastructureShared
-- Name: 8c7825db166f
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
