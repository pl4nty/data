-- Threat: !InfrastructureShared
-- Name: 59786e1b2a98
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
