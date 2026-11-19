-- Threat: !InfrastructureShared
-- Name: 4b7886ff1a48
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
