-- Threat: !InfrastructureShared
-- Name: 6540ac67ea26
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
