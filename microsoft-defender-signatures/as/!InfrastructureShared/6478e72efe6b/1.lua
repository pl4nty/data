-- Threat: !InfrastructureShared
-- Name: 6478e72efe6b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
