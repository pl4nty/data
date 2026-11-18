-- Threat: !InfrastructureShared
-- Name: 9c782c9b040a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
