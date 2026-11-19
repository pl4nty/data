-- Threat: !InfrastructureShared
-- Name: 4a7807c57f05
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
