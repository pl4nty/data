-- Threat: !InfrastructureShared
-- Name: 5278897eb3f9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
