-- Threat: !InfrastructureShared
-- Name: 42781de76034
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
