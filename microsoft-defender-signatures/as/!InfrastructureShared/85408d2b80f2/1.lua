-- Threat: !InfrastructureShared
-- Name: 85408d2b80f2
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 17000 then
  return mp.INFECTED
end
return mp.CLEAN
