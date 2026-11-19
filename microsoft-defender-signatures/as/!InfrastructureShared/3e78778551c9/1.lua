-- Threat: !InfrastructureShared
-- Name: 3e78778551c9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
