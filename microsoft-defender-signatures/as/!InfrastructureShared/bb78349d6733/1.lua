-- Threat: !InfrastructureShared
-- Name: bb78349d6733
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
