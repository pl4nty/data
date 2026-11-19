-- Threat: !InfrastructureShared
-- Name: 867874e82b3a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
