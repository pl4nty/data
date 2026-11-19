-- Threat: !InfrastructureShared
-- Name: 5978cd36113f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
