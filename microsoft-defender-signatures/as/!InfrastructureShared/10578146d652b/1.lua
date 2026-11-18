-- Threat: !InfrastructureShared
-- Name: 10578146d652b
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
