-- Threat: !InfrastructureShared
-- Name: 7378185955e0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
