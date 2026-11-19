-- Threat: !InfrastructureShared
-- Name: 29787f256421
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
