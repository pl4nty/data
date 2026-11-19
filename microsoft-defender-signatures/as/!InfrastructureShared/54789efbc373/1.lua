-- Threat: !InfrastructureShared
-- Name: 54789efbc373
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
