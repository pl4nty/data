-- Threat: !InfrastructureShared
-- Name: 5e78053abb48
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
