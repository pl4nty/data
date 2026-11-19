-- Threat: !InfrastructureShared
-- Name: 3f785511c49d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
