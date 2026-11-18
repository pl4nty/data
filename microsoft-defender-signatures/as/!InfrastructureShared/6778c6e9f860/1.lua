-- Threat: !InfrastructureShared
-- Name: 6778c6e9f860
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
