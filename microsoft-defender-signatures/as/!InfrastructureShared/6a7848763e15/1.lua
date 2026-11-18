-- Threat: !InfrastructureShared
-- Name: 6a7848763e15
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
