-- Threat: !InfrastructureShared
-- Name: 5d7827fe37c8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
