-- Threat: !InfrastructureShared
-- Name: a9789a985cf8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
