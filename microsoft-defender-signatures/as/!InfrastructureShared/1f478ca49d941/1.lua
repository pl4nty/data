-- Threat: !InfrastructureShared
-- Name: 1f478ca49d941
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
