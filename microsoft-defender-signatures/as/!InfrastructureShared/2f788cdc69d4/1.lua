-- Threat: !InfrastructureShared
-- Name: 2f788cdc69d4
-- Type: 21

if peattributes.amd64_image and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
