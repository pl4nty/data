-- Threat: !InfrastructureShared
-- Name: 54781b435388
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
