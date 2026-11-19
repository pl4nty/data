-- Threat: !InfrastructureShared
-- Name: 397837a0c5f7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
