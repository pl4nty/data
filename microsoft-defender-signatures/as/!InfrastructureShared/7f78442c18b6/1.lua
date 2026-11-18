-- Threat: !InfrastructureShared
-- Name: 7f78442c18b6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
