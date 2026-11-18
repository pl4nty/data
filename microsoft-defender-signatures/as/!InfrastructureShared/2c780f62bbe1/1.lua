-- Threat: !InfrastructureShared
-- Name: 2c780f62bbe1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
