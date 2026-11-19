-- Threat: !InfrastructureShared
-- Name: 7f78a483831f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
