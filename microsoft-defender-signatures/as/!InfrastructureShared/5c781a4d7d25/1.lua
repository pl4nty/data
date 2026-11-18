-- Threat: !InfrastructureShared
-- Name: 5c781a4d7d25
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
