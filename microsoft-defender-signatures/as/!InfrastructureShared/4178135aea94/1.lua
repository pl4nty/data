-- Threat: !InfrastructureShared
-- Name: 4178135aea94
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
