-- Threat: !InfrastructureShared
-- Name: 27781cea84f2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
