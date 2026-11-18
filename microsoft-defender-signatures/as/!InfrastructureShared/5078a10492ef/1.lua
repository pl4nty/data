-- Threat: !InfrastructureShared
-- Name: 5078a10492ef
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
