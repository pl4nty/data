-- Threat: !InfrastructureShared
-- Name: 747825452a10
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
