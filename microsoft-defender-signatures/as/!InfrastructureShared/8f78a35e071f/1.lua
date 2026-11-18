-- Threat: !InfrastructureShared
-- Name: 8f78a35e071f
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
