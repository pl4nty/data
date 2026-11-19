-- Threat: !InfrastructureShared
-- Name: 3b780dbf1c94
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
