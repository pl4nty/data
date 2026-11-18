-- Threat: !InfrastructureShared
-- Name: 4c7866e83960
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
