-- Threat: !InfrastructureShared
-- Name: 62785b7c71a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
