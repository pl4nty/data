-- Threat: !InfrastructureShared
-- Name: 92781df7203a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
