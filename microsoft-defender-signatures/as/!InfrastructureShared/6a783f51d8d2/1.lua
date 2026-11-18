-- Threat: !InfrastructureShared
-- Name: 6a783f51d8d2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
