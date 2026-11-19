-- Threat: !InfrastructureShared
-- Name: 8a78d8eac7f9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
