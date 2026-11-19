-- Threat: !InfrastructureShared
-- Name: 46788a1df3b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
