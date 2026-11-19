-- Threat: !InfrastructureShared
-- Name: 4978126b3208
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 1000000 and mp.getfilesize() <= 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
