-- Threat: !InfrastructureShared
-- Name: 9f78b7712eb8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
