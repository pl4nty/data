-- Threat: !InfrastructureShared
-- Name: 1447892bf7959
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and peattributes.no_security == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
