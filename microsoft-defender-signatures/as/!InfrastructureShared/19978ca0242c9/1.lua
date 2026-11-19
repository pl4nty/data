-- Threat: !InfrastructureShared
-- Name: 19978ca0242c9
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
