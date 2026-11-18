-- Threat: !InfrastructureShared
-- Name: c778e3a26ce2
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
