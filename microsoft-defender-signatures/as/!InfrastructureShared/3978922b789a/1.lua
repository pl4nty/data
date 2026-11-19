-- Threat: !InfrastructureShared
-- Name: 3978922b789a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
