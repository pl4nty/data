-- Threat: !InfrastructureShared
-- Name: 4b78431d6600
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
