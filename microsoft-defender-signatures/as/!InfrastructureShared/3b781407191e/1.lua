-- Threat: !InfrastructureShared
-- Name: 3b781407191e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
