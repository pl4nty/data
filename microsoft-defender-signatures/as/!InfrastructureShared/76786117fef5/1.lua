-- Threat: !InfrastructureShared
-- Name: 76786117fef5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
