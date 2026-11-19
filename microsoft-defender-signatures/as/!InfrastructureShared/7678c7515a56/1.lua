-- Threat: !InfrastructureShared
-- Name: 7678c7515a56
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
