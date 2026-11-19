-- Threat: !InfrastructureShared
-- Name: 80784fedea07
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
