-- Threat: !InfrastructureShared
-- Name: 71787c516c5d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
