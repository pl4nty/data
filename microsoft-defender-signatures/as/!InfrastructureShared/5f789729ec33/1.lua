-- Threat: !InfrastructureShared
-- Name: 5f789729ec33
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
