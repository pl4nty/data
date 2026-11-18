-- Threat: !InfrastructureShared
-- Name: 5d78c51e0e3e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 1006600 then
  return mp.INFECTED
end
return mp.CLEAN
