-- Threat: !InfrastructureShared
-- Name: 9978a373cf28
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
