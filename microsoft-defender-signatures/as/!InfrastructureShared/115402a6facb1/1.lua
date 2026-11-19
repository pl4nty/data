-- Threat: !InfrastructureShared
-- Name: 115402a6facb1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
