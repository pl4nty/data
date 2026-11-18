-- Threat: !InfrastructureShared
-- Name: 3278cf87080d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
