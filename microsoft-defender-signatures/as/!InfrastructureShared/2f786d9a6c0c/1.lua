-- Threat: !InfrastructureShared
-- Name: 2f786d9a6c0c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
