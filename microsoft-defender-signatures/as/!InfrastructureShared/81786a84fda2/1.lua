-- Threat: !InfrastructureShared
-- Name: 81786a84fda2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
