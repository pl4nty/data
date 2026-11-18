-- Threat: !InfrastructureShared
-- Name: 9678c745d501
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
