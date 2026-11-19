-- Threat: !InfrastructureShared
-- Name: 3c78bc650cca
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2115584 then
  return mp.INFECTED
end
return mp.CLEAN
