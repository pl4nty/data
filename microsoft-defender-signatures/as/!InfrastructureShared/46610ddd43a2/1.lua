-- Threat: !InfrastructureShared
-- Name: 46610ddd43a2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
