-- Threat: !InfrastructureShared
-- Name: 66788f5fb4de
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
