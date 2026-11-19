-- Threat: !InfrastructureShared
-- Name: 81789b4192b2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
