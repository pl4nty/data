-- Threat: !InfrastructureShared
-- Name: 71785552f72a
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
