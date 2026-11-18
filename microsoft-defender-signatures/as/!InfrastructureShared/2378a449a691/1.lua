-- Threat: !InfrastructureShared
-- Name: 2378a449a691
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
