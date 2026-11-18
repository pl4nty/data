-- Threat: !InfrastructureShared
-- Name: 13f78e9937d8c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
