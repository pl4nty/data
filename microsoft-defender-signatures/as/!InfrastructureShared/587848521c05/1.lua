-- Threat: !InfrastructureShared
-- Name: 587848521c05
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
