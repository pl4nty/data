-- Threat: !InfrastructureShared
-- Name: 45783f61ff31
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
