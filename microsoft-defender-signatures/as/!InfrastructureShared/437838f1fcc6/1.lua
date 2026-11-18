-- Threat: !InfrastructureShared
-- Name: 437838f1fcc6
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
