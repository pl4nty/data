-- Threat: !InfrastructureShared
-- Name: 5078bbc9e78d
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
