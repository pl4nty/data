-- Threat: !InfrastructureShared
-- Name: 53786a714602
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
