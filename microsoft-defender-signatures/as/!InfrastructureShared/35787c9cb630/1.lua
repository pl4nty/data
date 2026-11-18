-- Threat: !InfrastructureShared
-- Name: 35787c9cb630
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
