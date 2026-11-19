-- Threat: !InfrastructureShared
-- Name: f5405d016731
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
