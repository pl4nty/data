-- Threat: !InfrastructureShared
-- Name: 5778483d21c0
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
