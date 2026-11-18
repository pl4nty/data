-- Threat: !InfrastructureShared
-- Name: 4078c3455382
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
