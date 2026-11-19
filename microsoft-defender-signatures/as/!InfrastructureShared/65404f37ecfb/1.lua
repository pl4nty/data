-- Threat: !InfrastructureShared
-- Name: 65404f37ecfb
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
