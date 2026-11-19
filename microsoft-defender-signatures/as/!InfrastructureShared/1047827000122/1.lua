-- Threat: !InfrastructureShared
-- Name: 1047827000122
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
