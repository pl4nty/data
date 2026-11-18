-- Threat: !InfrastructureShared
-- Name: 4540180dac83
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
