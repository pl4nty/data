-- Threat: !InfrastructureShared
-- Name: 82789bbd2570
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
