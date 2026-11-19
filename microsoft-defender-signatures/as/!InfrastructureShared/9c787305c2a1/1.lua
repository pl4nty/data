-- Threat: !InfrastructureShared
-- Name: 9c787305c2a1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
