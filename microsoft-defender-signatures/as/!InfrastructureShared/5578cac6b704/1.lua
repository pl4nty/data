-- Threat: !InfrastructureShared
-- Name: 5578cac6b704
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 9500000 and mp.getfilesize() < 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
