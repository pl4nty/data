-- Threat: !InfrastructureShared
-- Name: 5c787adc0330
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
