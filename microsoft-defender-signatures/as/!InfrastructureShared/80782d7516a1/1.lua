-- Threat: !InfrastructureShared
-- Name: 80782d7516a1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
