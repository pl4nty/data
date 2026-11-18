-- Threat: !InfrastructureShared
-- Name: 7378bbe8ad9c
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
