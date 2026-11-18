-- Threat: !InfrastructureShared
-- Name: 6e783a9cd974
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
