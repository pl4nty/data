-- Threat: !InfrastructureShared
-- Name: de78383dbd90
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
