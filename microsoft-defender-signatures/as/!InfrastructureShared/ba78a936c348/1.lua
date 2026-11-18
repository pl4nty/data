-- Threat: !InfrastructureShared
-- Name: ba78a936c348
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
