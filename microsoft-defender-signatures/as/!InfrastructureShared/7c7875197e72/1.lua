-- Threat: !InfrastructureShared
-- Name: 7c7875197e72
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
