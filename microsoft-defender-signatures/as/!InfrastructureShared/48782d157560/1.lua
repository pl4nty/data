-- Threat: !InfrastructureShared
-- Name: 48782d157560
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() > 20000 and mp.getfilesize() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN
