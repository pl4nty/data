-- Threat: !InfrastructureShared
-- Name: ce78081a117b
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
