-- Threat: !InfrastructureShared
-- Name: 51780b538b75
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
