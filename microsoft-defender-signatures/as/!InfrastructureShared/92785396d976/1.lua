-- Threat: !InfrastructureShared
-- Name: 92785396d976
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
