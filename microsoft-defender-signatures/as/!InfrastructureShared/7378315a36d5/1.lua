-- Threat: !InfrastructureShared
-- Name: 7378315a36d5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
