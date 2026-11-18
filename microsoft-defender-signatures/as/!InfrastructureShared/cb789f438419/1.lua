-- Threat: !InfrastructureShared
-- Name: cb789f438419
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
