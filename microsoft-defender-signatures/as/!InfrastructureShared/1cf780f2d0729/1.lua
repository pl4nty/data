-- Threat: !InfrastructureShared
-- Name: 1cf780f2d0729
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
