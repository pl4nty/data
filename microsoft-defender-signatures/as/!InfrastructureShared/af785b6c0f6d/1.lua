-- Threat: !InfrastructureShared
-- Name: af785b6c0f6d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
