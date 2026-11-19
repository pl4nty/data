-- Threat: !InfrastructureShared
-- Name: 5b78ed24f279
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
