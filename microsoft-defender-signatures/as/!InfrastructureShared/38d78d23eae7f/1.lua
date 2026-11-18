-- Threat: !InfrastructureShared
-- Name: 38d78d23eae7f
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
