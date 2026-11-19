-- Threat: !InfrastructureShared
-- Name: 2778fd8707d1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
