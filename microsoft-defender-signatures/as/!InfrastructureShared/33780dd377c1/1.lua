-- Threat: !InfrastructureShared
-- Name: 33780dd377c1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
