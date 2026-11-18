-- Threat: !InfrastructureShared
-- Name: 5e788dc1976d
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 107000 and mp.getfilesize() > 90000 then
  return mp.INFECTED
end
return mp.CLEAN
