-- Threat: !InfrastructureShared
-- Name: 257891ef81c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
