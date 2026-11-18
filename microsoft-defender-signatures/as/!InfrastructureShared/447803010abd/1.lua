-- Threat: !InfrastructureShared
-- Name: 447803010abd
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
