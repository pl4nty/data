-- Threat: !InfrastructureShared
-- Name: cf78bf073e74
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
