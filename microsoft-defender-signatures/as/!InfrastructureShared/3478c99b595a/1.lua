-- Threat: !InfrastructureShared
-- Name: 3478c99b595a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
