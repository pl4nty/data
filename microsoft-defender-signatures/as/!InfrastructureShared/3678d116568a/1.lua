-- Threat: !InfrastructureShared
-- Name: 3678d116568a
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
