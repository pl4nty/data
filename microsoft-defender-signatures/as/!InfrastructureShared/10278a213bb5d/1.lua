-- Threat: !InfrastructureShared
-- Name: 10278a213bb5d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
