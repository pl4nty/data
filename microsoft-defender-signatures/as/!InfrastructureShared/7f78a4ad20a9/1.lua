-- Threat: !InfrastructureShared
-- Name: 7f78a4ad20a9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
