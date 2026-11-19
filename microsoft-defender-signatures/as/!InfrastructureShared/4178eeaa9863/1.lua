-- Threat: !InfrastructureShared
-- Name: 4178eeaa9863
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() <= 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
