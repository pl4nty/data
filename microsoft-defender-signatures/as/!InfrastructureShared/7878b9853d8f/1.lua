-- Threat: !InfrastructureShared
-- Name: 7878b9853d8f
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
