-- Threat: !InfrastructureShared
-- Name: 7c784ba7c0ff
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
