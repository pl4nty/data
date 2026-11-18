-- Threat: !InfrastructureShared
-- Name: 8378ecee1379
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
