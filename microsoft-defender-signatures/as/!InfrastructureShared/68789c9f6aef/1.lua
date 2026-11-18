-- Threat: !InfrastructureShared
-- Name: 68789c9f6aef
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
