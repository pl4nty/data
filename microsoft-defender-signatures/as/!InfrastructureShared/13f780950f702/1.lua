-- Threat: !InfrastructureShared
-- Name: 13f780950f702
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
