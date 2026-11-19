-- Threat: !InfrastructureShared
-- Name: 8178ca072196
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
