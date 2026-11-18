-- Threat: !InfrastructureShared
-- Name: 447857c51a97
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
