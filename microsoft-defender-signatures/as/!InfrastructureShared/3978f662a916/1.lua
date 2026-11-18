-- Threat: !InfrastructureShared
-- Name: 3978f662a916
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
