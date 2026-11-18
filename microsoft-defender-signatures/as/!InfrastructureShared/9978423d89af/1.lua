-- Threat: !InfrastructureShared
-- Name: 9978423d89af
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 6700 then
  return mp.INFECTED
end
return mp.CLEAN
