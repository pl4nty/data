-- Threat: !InfrastructureShared
-- Name: 6f78cbb70084
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
