-- Threat: !InfrastructureShared
-- Name: 207862046d0f
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
