-- Threat: !InfrastructureShared
-- Name: 10540fa49a668
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
