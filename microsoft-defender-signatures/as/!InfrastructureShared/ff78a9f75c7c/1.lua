-- Threat: !InfrastructureShared
-- Name: ff78a9f75c7c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
