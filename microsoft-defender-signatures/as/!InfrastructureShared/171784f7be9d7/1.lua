-- Threat: !InfrastructureShared
-- Name: 171784f7be9d7
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
