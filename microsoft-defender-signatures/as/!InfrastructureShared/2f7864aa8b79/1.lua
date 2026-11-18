-- Threat: !InfrastructureShared
-- Name: 2f7864aa8b79
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
