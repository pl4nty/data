-- Threat: !InfrastructureShared
-- Name: 6e78dea9c498
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
