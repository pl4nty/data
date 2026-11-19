-- Threat: !InfrastructureShared
-- Name: 7778a8704790
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
