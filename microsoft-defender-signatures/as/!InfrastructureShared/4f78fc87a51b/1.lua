-- Threat: !InfrastructureShared
-- Name: 4f78fc87a51b
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
