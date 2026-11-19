-- Threat: !InfrastructureShared
-- Name: 20378d9a3b88e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
