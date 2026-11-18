-- Threat: !InfrastructureShared
-- Name: 5778a73c280c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
