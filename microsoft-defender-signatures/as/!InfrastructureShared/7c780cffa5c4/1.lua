-- Threat: !InfrastructureShared
-- Name: 7c780cffa5c4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
