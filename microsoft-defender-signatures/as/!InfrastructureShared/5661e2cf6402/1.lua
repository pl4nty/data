-- Threat: !InfrastructureShared
-- Name: 5661e2cf6402
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
