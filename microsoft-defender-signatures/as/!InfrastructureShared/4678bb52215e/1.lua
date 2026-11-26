-- Threat: !InfrastructureShared
-- Name: 4678bb52215e
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 and mp.getfilesize() > 10000 then
  return mp.INFECTED
end
return mp.CLEAN
