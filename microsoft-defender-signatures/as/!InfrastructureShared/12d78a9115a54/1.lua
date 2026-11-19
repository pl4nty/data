-- Threat: !InfrastructureShared
-- Name: 12d78a9115a54
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
