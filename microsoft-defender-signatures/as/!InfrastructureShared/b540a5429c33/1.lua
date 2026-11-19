-- Threat: !InfrastructureShared
-- Name: b540a5429c33
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
