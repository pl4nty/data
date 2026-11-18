-- Threat: !InfrastructureShared
-- Name: 467880d82c2a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
