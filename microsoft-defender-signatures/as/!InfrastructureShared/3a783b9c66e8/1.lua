-- Threat: !InfrastructureShared
-- Name: 3a783b9c66e8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
