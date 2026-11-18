-- Threat: !InfrastructureShared
-- Name: 5d78a6800c31
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
