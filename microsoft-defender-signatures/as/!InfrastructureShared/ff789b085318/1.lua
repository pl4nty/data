-- Threat: !InfrastructureShared
-- Name: ff789b085318
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
