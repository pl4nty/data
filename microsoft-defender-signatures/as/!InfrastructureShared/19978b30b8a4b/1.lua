-- Threat: !InfrastructureShared
-- Name: 19978b30b8a4b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
