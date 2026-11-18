-- Threat: !InfrastructureShared
-- Name: d6787693e63f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
