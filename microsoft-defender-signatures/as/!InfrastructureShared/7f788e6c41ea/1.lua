-- Threat: !InfrastructureShared
-- Name: 7f788e6c41ea
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
