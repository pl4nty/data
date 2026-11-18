-- Threat: !InfrastructureShared
-- Name: 5d78f9cf9462
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 210000 and mp.getfilesize() < 230000 then
  return mp.INFECTED
end
return mp.CLEAN
