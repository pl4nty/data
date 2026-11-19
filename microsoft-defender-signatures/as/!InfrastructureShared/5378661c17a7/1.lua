-- Threat: !InfrastructureShared
-- Name: 5378661c17a7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
