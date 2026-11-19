-- Threat: !InfrastructureShared
-- Name: 74786c06c606
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
