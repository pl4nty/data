-- Threat: !InfrastructureShared
-- Name: 6f78b2684e3c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
