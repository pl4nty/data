-- Threat: !InfrastructureShared
-- Name: 4378b87dd522
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
