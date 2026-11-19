-- Threat: !InfrastructureShared
-- Name: 13978294f409a
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
