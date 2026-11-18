-- Threat: !InfrastructureShared
-- Name: 5778008e4036
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
