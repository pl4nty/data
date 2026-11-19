-- Threat: !InfrastructureShared
-- Name: 7d782d8f5284
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
