-- Threat: !InfrastructureShared
-- Name: 8b78e95552c8
-- Type: 21

if peattributes.isdll and mp.getfilesize() > 9000000 then
  return mp.INFECTED
end
return mp.CLEAN
