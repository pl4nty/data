-- Threat: !InfrastructureShared
-- Name: 8f786ae3d71d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
