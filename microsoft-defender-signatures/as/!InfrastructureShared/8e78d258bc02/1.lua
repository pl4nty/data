-- Threat: !InfrastructureShared
-- Name: 8e78d258bc02
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
