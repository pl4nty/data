-- Threat: !InfrastructureShared
-- Name: e540ca29a745
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
