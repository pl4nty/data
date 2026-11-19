-- Threat: !InfrastructureShared
-- Name: 5278196c4551
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
