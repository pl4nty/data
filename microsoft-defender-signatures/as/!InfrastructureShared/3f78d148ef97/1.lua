-- Threat: !InfrastructureShared
-- Name: 3f78d148ef97
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
