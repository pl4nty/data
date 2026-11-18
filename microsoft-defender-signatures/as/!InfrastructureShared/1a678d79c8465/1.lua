-- Threat: !InfrastructureShared
-- Name: 1a678d79c8465
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
