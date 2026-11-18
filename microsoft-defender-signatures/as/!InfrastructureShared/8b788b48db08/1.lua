-- Threat: !InfrastructureShared
-- Name: 8b788b48db08
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
