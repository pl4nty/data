-- Threat: !InfrastructureShared
-- Name: 18c78ef828a9a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
