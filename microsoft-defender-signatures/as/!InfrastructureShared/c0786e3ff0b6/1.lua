-- Threat: !InfrastructureShared
-- Name: c0786e3ff0b6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
