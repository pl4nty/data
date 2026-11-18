-- Threat: !InfrastructureShared
-- Name: 4078336df230
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
