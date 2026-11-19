-- Threat: !InfrastructureShared
-- Name: cd78899904dd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
