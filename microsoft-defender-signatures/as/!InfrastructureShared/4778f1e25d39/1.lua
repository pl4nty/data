-- Threat: !InfrastructureShared
-- Name: 4778f1e25d39
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
