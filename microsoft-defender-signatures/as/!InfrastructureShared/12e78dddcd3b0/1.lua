-- Threat: !InfrastructureShared
-- Name: 12e78dddcd3b0
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
