-- Threat: !InfrastructureShared
-- Name: 507800ba0b4c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
