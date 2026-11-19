-- Threat: !InfrastructureShared
-- Name: 5d781ecb04fc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
