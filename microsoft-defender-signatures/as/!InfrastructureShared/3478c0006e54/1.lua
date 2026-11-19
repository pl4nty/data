-- Threat: !InfrastructureShared
-- Name: 3478c0006e54
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
