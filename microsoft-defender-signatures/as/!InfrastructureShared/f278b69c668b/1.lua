-- Threat: !InfrastructureShared
-- Name: f278b69c668b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
