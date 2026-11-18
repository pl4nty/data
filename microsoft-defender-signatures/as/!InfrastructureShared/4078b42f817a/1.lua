-- Threat: !InfrastructureShared
-- Name: 4078b42f817a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
