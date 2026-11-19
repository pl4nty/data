-- Threat: !InfrastructureShared
-- Name: 4078bb0dc966
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
