-- Threat: !InfrastructureShared
-- Name: 9e78247a55ec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
