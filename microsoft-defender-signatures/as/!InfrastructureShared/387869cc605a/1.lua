-- Threat: !InfrastructureShared
-- Name: 387869cc605a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
