-- Threat: !InfrastructureShared
-- Name: 2e78f6760758
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
