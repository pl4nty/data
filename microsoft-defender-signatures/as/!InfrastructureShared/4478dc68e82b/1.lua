-- Threat: !InfrastructureShared
-- Name: 4478dc68e82b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
