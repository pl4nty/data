-- Threat: !InfrastructureShared
-- Name: 3978f15ebed7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
