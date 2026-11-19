-- Threat: !InfrastructureShared
-- Name: 46782b790114
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
