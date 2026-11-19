-- Threat: !InfrastructureShared
-- Name: 587841daf543
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
