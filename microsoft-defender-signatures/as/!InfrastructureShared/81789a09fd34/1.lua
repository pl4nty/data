-- Threat: !InfrastructureShared
-- Name: 81789a09fd34
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
