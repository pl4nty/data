-- Threat: !InfrastructureShared
-- Name: 8678c0d27ee9
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
