-- Threat: !InfrastructureShared
-- Name: 547893a38d4e
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
