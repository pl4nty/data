-- Threat: !InfrastructureShared
-- Name: 4978879f4d7a
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
