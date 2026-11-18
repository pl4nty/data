-- Threat: !InfrastructureShared
-- Name: de610ea18882
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
