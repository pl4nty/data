-- Threat: !InfrastructureShared
-- Name: 3854067ce8086
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
