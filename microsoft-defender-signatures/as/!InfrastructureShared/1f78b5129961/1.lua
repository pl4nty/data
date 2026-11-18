-- Threat: !InfrastructureShared
-- Name: 1f78b5129961
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
