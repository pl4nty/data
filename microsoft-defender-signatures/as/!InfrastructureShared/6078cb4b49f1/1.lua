-- Threat: !InfrastructureShared
-- Name: 6078cb4b49f1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
