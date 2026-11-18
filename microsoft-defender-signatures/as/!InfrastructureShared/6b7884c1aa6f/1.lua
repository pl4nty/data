-- Threat: !InfrastructureShared
-- Name: 6b7884c1aa6f
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 405000 and mp.getfilesize() < 440000 then
  return mp.INFECTED
end
return mp.CLEAN
