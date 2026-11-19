-- Threat: !InfrastructureShared
-- Name: f17809e6eb6f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
