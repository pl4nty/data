-- Threat: !InfrastructureShared
-- Name: 4e78a1b9060e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
