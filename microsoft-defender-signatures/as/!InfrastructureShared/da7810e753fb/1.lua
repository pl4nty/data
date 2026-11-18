-- Threat: !InfrastructureShared
-- Name: da7810e753fb
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 4048000 then
  return mp.INFECTED
end
return mp.CLEAN
