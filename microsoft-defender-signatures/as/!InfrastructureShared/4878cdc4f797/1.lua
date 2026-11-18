-- Threat: !InfrastructureShared
-- Name: 4878cdc4f797
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
