-- Threat: !InfrastructureShared
-- Name: e378dee061e2
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
