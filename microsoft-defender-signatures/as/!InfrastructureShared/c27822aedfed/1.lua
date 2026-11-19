-- Threat: !InfrastructureShared
-- Name: c27822aedfed
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
