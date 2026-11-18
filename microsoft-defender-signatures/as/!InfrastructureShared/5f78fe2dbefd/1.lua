-- Threat: !InfrastructureShared
-- Name: 5f78fe2dbefd
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
