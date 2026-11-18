-- Threat: !InfrastructureShared
-- Name: 8478b6a36da5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
