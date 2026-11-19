-- Threat: !InfrastructureShared
-- Name: 56780e386317
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
