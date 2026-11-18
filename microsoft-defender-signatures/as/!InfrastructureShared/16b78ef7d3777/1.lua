-- Threat: !InfrastructureShared
-- Name: 16b78ef7d3777
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
