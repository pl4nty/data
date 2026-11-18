-- Threat: !InfrastructureShared
-- Name: 58783508d509
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
