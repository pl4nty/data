-- Threat: !InfrastructureShared
-- Name: 7078b7fad6b3
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 5020000 and mp.getfilesize() < 5400000 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
