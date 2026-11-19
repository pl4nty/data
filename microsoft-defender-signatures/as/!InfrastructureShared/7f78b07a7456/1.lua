-- Threat: !InfrastructureShared
-- Name: 7f78b07a7456
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
