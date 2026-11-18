-- Threat: !InfrastructureShared
-- Name: 4d78cb4030f2
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
