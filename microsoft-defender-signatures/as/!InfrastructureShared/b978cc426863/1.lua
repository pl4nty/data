-- Threat: !InfrastructureShared
-- Name: b978cc426863
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
