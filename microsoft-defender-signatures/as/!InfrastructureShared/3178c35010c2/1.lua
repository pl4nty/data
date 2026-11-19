-- Threat: !InfrastructureShared
-- Name: 3178c35010c2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
