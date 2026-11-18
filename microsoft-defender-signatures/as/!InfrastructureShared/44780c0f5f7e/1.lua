-- Threat: !InfrastructureShared
-- Name: 44780c0f5f7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
