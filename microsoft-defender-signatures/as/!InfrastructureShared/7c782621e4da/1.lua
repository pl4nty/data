-- Threat: !InfrastructureShared
-- Name: 7c782621e4da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
