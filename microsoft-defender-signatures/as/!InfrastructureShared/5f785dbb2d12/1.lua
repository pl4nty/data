-- Threat: !InfrastructureShared
-- Name: 5f785dbb2d12
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
