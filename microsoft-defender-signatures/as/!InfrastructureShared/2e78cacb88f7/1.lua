-- Threat: !InfrastructureShared
-- Name: 2e78cacb88f7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
