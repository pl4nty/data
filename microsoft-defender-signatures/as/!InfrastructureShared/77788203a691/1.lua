-- Threat: !InfrastructureShared
-- Name: 77788203a691
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
