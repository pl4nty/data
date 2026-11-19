-- Threat: !InfrastructureShared
-- Name: e87859b704bb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 4100000 then
  return mp.INFECTED
end
return mp.CLEAN
