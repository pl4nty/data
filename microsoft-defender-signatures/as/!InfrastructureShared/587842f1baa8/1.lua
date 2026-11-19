-- Threat: !InfrastructureShared
-- Name: 587842f1baa8
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
