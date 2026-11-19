-- Threat: !InfrastructureShared
-- Name: 22e7856a3b1a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
