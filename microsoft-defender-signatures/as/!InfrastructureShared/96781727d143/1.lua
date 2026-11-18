-- Threat: !InfrastructureShared
-- Name: 96781727d143
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 300000 and mp.getfilesize() > 50000 then
  return mp.INFECTED
end
return mp.CLEAN
