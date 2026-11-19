-- Threat: !InfrastructureShared
-- Name: 44784af3de21
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
