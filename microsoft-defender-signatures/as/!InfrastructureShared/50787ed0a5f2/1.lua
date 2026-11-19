-- Threat: !InfrastructureShared
-- Name: 50787ed0a5f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
