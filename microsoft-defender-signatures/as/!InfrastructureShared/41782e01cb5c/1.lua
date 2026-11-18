-- Threat: !InfrastructureShared
-- Name: 41782e01cb5c
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
