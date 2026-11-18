-- Threat: !InfrastructureShared
-- Name: 8a78b2d657d1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
