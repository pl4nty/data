-- Threat: !InfrastructureShared
-- Name: 5c78a955c7d7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
