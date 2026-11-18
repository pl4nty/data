-- Threat: !InfrastructureShared
-- Name: 30786b9dc39c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
