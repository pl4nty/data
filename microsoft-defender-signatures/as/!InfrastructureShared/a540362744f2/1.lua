-- Threat: !InfrastructureShared
-- Name: a540362744f2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
