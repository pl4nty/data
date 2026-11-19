-- Threat: !InfrastructureShared
-- Name: 7078deafa408
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
