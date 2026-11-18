-- Threat: !InfrastructureShared
-- Name: e278911c69ce
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
