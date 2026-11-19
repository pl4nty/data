-- Threat: !InfrastructureShared
-- Name: 49780d2a9438
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
