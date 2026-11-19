-- Threat: !InfrastructureShared
-- Name: 8578c00849a1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
