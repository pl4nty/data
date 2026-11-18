-- Threat: !InfrastructureShared
-- Name: 5578aebfec35
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
