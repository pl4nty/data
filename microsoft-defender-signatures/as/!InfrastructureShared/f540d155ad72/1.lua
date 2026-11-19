-- Threat: !InfrastructureShared
-- Name: f540d155ad72
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 323584 then
  return mp.INFECTED
end
return mp.CLEAN
