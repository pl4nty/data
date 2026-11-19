-- Threat: !InfrastructureShared
-- Name: 587891496381
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
