-- Threat: !InfrastructureShared
-- Name: b078465a9b86
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
