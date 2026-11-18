-- Threat: !InfrastructureShared
-- Name: 8178260b021b
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
