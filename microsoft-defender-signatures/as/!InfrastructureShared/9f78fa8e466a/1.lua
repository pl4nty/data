-- Threat: !InfrastructureShared
-- Name: 9f78fa8e466a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
