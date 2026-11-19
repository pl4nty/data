-- Threat: !InfrastructureShared
-- Name: 12378465964dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
