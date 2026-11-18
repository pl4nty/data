-- Threat: !InfrastructureShared
-- Name: 38788ac3678a
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
