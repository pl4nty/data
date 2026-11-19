-- Threat: !InfrastructureShared
-- Name: 28785c273d53
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
