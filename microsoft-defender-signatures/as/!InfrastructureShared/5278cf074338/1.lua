-- Threat: !InfrastructureShared
-- Name: 5278cf074338
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
