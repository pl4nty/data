-- Threat: !InfrastructureShared
-- Name: 5978410014ec
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
