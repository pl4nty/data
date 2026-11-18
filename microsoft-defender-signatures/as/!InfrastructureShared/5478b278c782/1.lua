-- Threat: !InfrastructureShared
-- Name: 5478b278c782
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
