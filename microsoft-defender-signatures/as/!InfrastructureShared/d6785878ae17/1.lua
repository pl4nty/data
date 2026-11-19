-- Threat: !InfrastructureShared
-- Name: d6785878ae17
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
