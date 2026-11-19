-- Threat: !InfrastructureShared
-- Name: 44782d26b386
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
