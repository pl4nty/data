-- Threat: !InfrastructureShared
-- Name: 277897256830
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
