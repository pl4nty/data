-- Threat: !InfrastructureShared
-- Name: 9678539e97c2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
