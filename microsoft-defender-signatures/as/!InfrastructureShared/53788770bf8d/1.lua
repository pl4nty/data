-- Threat: !InfrastructureShared
-- Name: 53788770bf8d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
