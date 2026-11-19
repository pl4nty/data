-- Threat: !InfrastructureShared
-- Name: 5978655afb2a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
