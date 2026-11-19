-- Threat: !InfrastructureShared
-- Name: 7078c04ee38c
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
