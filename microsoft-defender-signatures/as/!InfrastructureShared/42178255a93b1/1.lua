-- Threat: !InfrastructureShared
-- Name: 42178255a93b1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
