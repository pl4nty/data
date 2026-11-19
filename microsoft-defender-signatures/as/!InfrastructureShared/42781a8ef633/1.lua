-- Threat: !InfrastructureShared
-- Name: 42781a8ef633
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
