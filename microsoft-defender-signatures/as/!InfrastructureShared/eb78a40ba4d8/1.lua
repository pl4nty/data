-- Threat: !InfrastructureShared
-- Name: eb78a40ba4d8
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
