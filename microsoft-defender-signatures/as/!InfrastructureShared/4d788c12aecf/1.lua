-- Threat: !InfrastructureShared
-- Name: 4d788c12aecf
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
