-- Threat: !InfrastructureShared
-- Name: 3078a0088c08
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
