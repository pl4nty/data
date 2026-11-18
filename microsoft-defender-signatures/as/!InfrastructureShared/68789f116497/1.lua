-- Threat: !InfrastructureShared
-- Name: 68789f116497
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
