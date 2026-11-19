-- Threat: !InfrastructureShared
-- Name: 507889be2c45
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
