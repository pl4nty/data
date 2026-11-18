-- Threat: !InfrastructureShared
-- Name: 8e7883dc2ac2
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
