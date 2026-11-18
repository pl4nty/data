-- Threat: !InfrastructureShared
-- Name: 5178bd34aeff
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
