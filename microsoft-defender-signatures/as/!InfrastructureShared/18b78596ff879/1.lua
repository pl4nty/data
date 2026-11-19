-- Threat: !InfrastructureShared
-- Name: 18b78596ff879
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
