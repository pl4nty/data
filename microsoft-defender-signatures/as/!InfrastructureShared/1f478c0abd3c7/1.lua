-- Threat: !InfrastructureShared
-- Name: 1f478c0abd3c7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
