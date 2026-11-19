-- Threat: !InfrastructureShared
-- Name: c361b231b9a4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
