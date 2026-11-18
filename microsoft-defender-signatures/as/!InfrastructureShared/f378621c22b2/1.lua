-- Threat: !InfrastructureShared
-- Name: f378621c22b2
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
