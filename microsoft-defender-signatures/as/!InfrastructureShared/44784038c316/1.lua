-- Threat: !InfrastructureShared
-- Name: 44784038c316
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
