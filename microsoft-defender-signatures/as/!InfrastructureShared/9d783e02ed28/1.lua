-- Threat: !InfrastructureShared
-- Name: 9d783e02ed28
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
