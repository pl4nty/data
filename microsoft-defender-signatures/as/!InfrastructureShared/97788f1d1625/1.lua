-- Threat: !InfrastructureShared
-- Name: 97788f1d1625
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
