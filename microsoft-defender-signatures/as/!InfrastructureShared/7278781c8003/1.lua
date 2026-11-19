-- Threat: !InfrastructureShared
-- Name: 7278781c8003
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
