-- Threat: !InfrastructureShared
-- Name: bd78d03e22da
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
