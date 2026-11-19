-- Threat: !InfrastructureShared
-- Name: 1be7853f2f8b5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
