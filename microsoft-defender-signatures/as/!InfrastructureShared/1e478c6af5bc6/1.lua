-- Threat: !InfrastructureShared
-- Name: 1e478c6af5bc6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
