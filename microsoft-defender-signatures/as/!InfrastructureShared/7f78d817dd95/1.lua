-- Threat: !InfrastructureShared
-- Name: 7f78d817dd95
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
