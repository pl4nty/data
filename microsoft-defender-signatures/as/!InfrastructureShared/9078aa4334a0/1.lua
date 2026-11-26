-- Threat: !InfrastructureShared
-- Name: 9078aa4334a0
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 and mp.getfilesize() > 10000 then
  return mp.INFECTED
end
return mp.CLEAN
