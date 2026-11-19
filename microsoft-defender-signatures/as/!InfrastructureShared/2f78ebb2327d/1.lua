-- Threat: !InfrastructureShared
-- Name: 2f78ebb2327d
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
