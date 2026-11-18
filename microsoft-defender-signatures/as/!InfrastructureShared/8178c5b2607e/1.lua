-- Threat: !InfrastructureShared
-- Name: 8178c5b2607e
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
