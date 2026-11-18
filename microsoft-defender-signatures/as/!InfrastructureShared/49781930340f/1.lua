-- Threat: !InfrastructureShared
-- Name: 49781930340f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
