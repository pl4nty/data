-- Threat: !InfrastructureShared
-- Name: 9978608157a9
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
