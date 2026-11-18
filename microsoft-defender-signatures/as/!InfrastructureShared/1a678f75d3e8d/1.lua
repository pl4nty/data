-- Threat: !InfrastructureShared
-- Name: 1a678f75d3e8d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
