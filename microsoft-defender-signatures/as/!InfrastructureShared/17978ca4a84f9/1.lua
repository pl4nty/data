-- Threat: !InfrastructureShared
-- Name: 17978ca4a84f9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
