-- Threat: !InfrastructureShared
-- Name: 6d7898ab994e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
