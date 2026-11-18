-- Threat: !InfrastructureShared
-- Name: 5078bae3140d
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
