-- Threat: !InfrastructureShared
-- Name: 6878c99eb0d0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
