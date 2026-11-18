-- Threat: !InfrastructureShared
-- Name: 58789df2ec03
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
