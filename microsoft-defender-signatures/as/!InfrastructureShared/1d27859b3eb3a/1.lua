-- Threat: !InfrastructureShared
-- Name: 1d27859b3eb3a
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
