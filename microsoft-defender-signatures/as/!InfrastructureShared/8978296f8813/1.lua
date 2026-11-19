-- Threat: !InfrastructureShared
-- Name: 8978296f8813
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
