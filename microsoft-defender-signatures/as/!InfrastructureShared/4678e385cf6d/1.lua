-- Threat: !InfrastructureShared
-- Name: 4678e385cf6d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
