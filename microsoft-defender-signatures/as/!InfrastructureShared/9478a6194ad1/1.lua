-- Threat: !InfrastructureShared
-- Name: 9478a6194ad1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
