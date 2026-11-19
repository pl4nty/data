-- Threat: !InfrastructureShared
-- Name: 4078ac8cd324
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
