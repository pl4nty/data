-- Threat: !InfrastructureShared
-- Name: 7f7810bdf9c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
