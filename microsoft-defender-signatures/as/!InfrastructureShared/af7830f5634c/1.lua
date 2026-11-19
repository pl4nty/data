-- Threat: !InfrastructureShared
-- Name: af7830f5634c
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
