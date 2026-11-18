-- Threat: !InfrastructureShared
-- Name: 2378e05892db
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
