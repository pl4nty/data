-- Threat: !InfrastructureShared
-- Name: 13b783c6766bb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
