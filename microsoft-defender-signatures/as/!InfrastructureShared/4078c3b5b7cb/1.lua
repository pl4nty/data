-- Threat: !InfrastructureShared
-- Name: 4078c3b5b7cb
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
