-- Threat: !InfrastructureShared
-- Name: 5d78e42d6c3c
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
