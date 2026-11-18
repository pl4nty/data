-- Threat: !InfrastructureShared
-- Name: c5780b086a4c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
