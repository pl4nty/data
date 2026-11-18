-- Threat: !InfrastructureShared
-- Name: 9161f034a728
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
