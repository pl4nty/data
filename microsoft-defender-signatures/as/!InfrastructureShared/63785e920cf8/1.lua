-- Threat: !InfrastructureShared
-- Name: 63785e920cf8
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
