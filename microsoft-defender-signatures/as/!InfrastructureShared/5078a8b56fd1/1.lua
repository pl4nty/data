-- Threat: !InfrastructureShared
-- Name: 5078a8b56fd1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
