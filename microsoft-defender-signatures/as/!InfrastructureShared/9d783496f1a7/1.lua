-- Threat: !InfrastructureShared
-- Name: 9d783496f1a7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
