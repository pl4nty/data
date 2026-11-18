-- Threat: !InfrastructureShared
-- Name: 93780daf91e5
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
