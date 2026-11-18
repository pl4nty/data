-- Threat: !InfrastructureShared
-- Name: 55616e210ac8
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
