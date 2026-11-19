-- Threat: !InfrastructureShared
-- Name: d978cf39b91c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
