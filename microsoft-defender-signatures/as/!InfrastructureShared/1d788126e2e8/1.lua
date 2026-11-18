-- Threat: !InfrastructureShared
-- Name: 1d788126e2e8
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
