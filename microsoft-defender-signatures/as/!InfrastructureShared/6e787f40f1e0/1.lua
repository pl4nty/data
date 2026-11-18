-- Threat: !InfrastructureShared
-- Name: 6e787f40f1e0
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
