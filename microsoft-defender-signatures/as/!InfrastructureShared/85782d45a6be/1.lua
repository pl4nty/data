-- Threat: !InfrastructureShared
-- Name: 85782d45a6be
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
