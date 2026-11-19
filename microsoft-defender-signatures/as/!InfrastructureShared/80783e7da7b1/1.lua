-- Threat: !InfrastructureShared
-- Name: 80783e7da7b1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
