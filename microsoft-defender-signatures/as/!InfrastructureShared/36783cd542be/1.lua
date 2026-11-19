-- Threat: !InfrastructureShared
-- Name: 36783cd542be
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
