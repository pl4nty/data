-- Threat: !InfrastructureShared
-- Name: 93781308af01
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
