-- Threat: !InfrastructureShared
-- Name: 50783d6cd19d
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
