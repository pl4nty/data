-- Threat: !InfrastructureShared
-- Name: 44782cb070f7
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
