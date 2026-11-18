-- Threat: !InfrastructureShared
-- Name: 7d78618067a4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
