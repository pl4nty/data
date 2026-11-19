-- Threat: !InfrastructureShared
-- Name: 12178d4d8dee3
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
