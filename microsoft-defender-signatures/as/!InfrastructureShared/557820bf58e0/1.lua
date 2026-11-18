-- Threat: !InfrastructureShared
-- Name: 557820bf58e0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
