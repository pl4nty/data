-- Threat: !InfrastructureShared
-- Name: 677864dea6da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
