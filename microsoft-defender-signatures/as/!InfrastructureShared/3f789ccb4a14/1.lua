-- Threat: !InfrastructureShared
-- Name: 3f789ccb4a14
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 9000 then
  return mp.INFECTED
end
return mp.CLEAN
