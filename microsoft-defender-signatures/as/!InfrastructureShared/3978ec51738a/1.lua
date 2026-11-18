-- Threat: !InfrastructureShared
-- Name: 3978ec51738a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
