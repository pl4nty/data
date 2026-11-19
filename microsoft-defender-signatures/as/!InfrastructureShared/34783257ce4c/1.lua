-- Threat: !InfrastructureShared
-- Name: 34783257ce4c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
