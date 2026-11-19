-- Threat: !InfrastructureShared
-- Name: 1177841eea9b4
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
