-- Threat: !InfrastructureShared
-- Name: 67783434594d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
