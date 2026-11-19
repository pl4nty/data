-- Threat: !InfrastructureShared
-- Name: 10c78063b36e9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
