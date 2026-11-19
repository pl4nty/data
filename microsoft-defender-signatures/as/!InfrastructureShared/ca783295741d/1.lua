-- Threat: !InfrastructureShared
-- Name: ca783295741d
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
