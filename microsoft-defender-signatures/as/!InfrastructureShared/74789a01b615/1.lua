-- Threat: !InfrastructureShared
-- Name: 74789a01b615
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
