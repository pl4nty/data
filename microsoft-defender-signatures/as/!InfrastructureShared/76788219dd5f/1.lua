-- Threat: !InfrastructureShared
-- Name: 76788219dd5f
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
