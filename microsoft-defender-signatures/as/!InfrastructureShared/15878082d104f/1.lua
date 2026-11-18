-- Threat: !InfrastructureShared
-- Name: 15878082d104f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
