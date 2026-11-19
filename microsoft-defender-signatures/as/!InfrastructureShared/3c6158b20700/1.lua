-- Threat: !InfrastructureShared
-- Name: 3c6158b20700
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
