-- Threat: !InfrastructureShared
-- Name: 7778c4f8687c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
