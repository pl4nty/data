-- Threat: !InfrastructureShared
-- Name: 17c7823f6667c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
