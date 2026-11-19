-- Threat: !InfrastructureShared
-- Name: 6878482c2719
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
