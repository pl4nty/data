-- Threat: !InfrastructureShared
-- Name: ea785ed40f20
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
