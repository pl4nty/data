-- Threat: !InfrastructureShared
-- Name: a27808a9efa4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
