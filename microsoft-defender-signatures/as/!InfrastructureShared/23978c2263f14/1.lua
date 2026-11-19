-- Threat: !InfrastructureShared
-- Name: 23978c2263f14
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
