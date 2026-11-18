-- Threat: !InfrastructureShared
-- Name: 14c7830bd04cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
