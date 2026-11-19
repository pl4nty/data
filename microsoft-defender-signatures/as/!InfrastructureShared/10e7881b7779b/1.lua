-- Threat: !InfrastructureShared
-- Name: 10e7881b7779b
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
