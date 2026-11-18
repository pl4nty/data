-- Threat: !InfrastructureShared
-- Name: f5405a6afce9
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
