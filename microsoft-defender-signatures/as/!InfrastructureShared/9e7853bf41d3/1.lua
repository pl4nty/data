-- Threat: !InfrastructureShared
-- Name: 9e7853bf41d3
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 250000 and mp.getfilesize() < 270000 then
  return mp.INFECTED
end
return mp.CLEAN
