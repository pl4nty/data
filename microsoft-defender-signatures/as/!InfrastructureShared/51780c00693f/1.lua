-- Threat: !InfrastructureShared
-- Name: 51780c00693f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
