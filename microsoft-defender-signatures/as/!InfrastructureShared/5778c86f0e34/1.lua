-- Threat: !InfrastructureShared
-- Name: 5778c86f0e34
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
