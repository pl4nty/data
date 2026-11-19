-- Threat: !InfrastructureShared
-- Name: 36783d6b7c39
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
