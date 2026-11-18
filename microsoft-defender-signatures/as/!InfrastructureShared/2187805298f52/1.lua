-- Threat: !InfrastructureShared
-- Name: 2187805298f52
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
