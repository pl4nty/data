-- Threat: !InfrastructureShared
-- Name: 8c78b9ea6805
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
