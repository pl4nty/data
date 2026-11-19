-- Threat: !InfrastructureShared
-- Name: 44784f427e60
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
