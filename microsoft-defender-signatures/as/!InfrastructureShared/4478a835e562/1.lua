-- Threat: !InfrastructureShared
-- Name: 4478a835e562
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
