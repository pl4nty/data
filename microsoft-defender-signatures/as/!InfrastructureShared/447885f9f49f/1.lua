-- Threat: !InfrastructureShared
-- Name: 447885f9f49f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
