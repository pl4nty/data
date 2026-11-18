-- Threat: !InfrastructureShared
-- Name: 66789c756ea6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
