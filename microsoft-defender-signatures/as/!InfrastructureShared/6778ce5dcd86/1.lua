-- Threat: !InfrastructureShared
-- Name: 6778ce5dcd86
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
