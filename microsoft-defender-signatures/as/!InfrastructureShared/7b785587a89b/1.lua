-- Threat: !InfrastructureShared
-- Name: 7b785587a89b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
