-- Threat: !InfrastructureShared
-- Name: d47854c1b089
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
