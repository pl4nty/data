-- Threat: !InfrastructureShared
-- Name: 9278c5b9bac1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
