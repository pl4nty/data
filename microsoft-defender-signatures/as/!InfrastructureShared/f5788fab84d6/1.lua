-- Threat: !InfrastructureShared
-- Name: f5788fab84d6
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
