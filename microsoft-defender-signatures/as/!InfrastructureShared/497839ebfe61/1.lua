-- Threat: !InfrastructureShared
-- Name: 497839ebfe61
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
