-- Threat: !InfrastructureShared
-- Name: 55789171a318
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
