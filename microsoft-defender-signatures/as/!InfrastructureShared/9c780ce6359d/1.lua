-- Threat: !InfrastructureShared
-- Name: 9c780ce6359d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
