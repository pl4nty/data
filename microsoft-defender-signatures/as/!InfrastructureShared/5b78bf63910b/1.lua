-- Threat: !InfrastructureShared
-- Name: 5b78bf63910b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
