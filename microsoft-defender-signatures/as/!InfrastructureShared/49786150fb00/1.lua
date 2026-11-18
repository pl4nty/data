-- Threat: !InfrastructureShared
-- Name: 49786150fb00
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
