-- Threat: !InfrastructureShared
-- Name: 7078a565e696
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
