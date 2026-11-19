-- Threat: !InfrastructureShared
-- Name: 3078139901a2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
