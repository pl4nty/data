-- Threat: !InfrastructureShared
-- Name: 7778b68bd8a9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
