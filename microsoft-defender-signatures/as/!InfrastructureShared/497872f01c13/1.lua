-- Threat: !InfrastructureShared
-- Name: 497872f01c13
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
