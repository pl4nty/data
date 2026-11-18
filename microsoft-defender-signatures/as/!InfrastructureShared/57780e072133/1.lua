-- Threat: !InfrastructureShared
-- Name: 57780e072133
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
