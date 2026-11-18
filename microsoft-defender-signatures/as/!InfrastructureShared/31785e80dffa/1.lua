-- Threat: !InfrastructureShared
-- Name: 31785e80dffa
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
