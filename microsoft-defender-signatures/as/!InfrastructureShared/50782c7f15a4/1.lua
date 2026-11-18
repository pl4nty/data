-- Threat: !InfrastructureShared
-- Name: 50782c7f15a4
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
