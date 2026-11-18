-- Threat: !InfrastructureShared
-- Name: 5878d90e2856
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
