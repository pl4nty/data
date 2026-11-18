-- Threat: !InfrastructureShared
-- Name: 6878f2cd0353
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 3100000 and mp.getfilesize() < 4800000 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
