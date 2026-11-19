-- Threat: !InfrastructureShared
-- Name: b540305b9389
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
