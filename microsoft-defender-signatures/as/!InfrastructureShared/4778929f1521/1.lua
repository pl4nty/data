-- Threat: !InfrastructureShared
-- Name: 4778929f1521
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
