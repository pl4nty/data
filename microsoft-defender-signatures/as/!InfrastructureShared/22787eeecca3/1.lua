-- Threat: !InfrastructureShared
-- Name: 22787eeecca3
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 4000000 and mp.getfilesize() < 4100000 then
  return mp.INFECTED
end
return mp.CLEAN
