-- Threat: !InfrastructureShared
-- Name: ac782a403526
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
