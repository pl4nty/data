-- Threat: !InfrastructureShared
-- Name: 50787d7ea763
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
