-- Threat: !InfrastructureShared
-- Name: 8e7895ab8e35
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
