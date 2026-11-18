-- Threat: !InfrastructureShared
-- Name: 5378e1452048
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
