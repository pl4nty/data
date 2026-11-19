-- Threat: !InfrastructureShared
-- Name: 77789ae3b3e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
