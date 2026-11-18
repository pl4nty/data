-- Threat: !InfrastructureShared
-- Name: 42787c45890e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
