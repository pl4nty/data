-- Threat: !InfrastructureShared
-- Name: a278527c014f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
